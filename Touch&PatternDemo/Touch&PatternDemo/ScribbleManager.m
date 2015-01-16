//
//  ScribbleManager.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "ScribbleManager.h"
#import "Scribble.h"
#import "OpenScribbleCommand.h"
#import "ScribbleThumbnailViewImageProxy.h"
#import "ScribbleMemento.h"
#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@interface ScribbleManager()

-(NSString *)scribbleDataPath;
-(NSString *)scribbleThumbnailPath;
-(NSArray *)scribbleDataPaths;
-(NSArray *)scribbleThumbnailPaths;

@end

@implementation ScribbleManager
/*! MacBook Pro 2015-01-16 10:14 编辑
 *  @brief  保存涂鸦图的方法
 *
 *  @param scribble <#scribble description#>
 *  @param image    <#image description#>
 *
 *  @since <#version number#>
 */
-(void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image{
    NSInteger newIndex=[self numberOfScribbles]+1;
    //use the index as part of the name for each of them
    NSString *scribbleDataName=[NSString stringWithFormat:@"data_%ld",(long)newIndex];
    NSString *scribbleThumbnailName=[NSString stringWithFormat:@"thumbnail_%ld.png",(long)newIndex];
    
    //get a memento from the scribble
    //the save the memento in the file system
    ScribbleMemento *scribbleMemento=[scribble scribbleMemento];
    NSData *mementoData=[scribbleMemento data];

    NSString *mementoPath=[[self scribbleDataPath]stringByAppendingPathComponent:scribbleDataName];
    NSLog(@"涂鸦图保存的路径是:%@",mementoPath);
    [mementoData writeToFile:mementoPath atomically:YES];
    
    //保存缩略图
    NSData *imageData=[NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagepath=[[self scribbleThumbnailPath]stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagepath atomically:YES];
    
}
-(NSInteger)numberOfScribbles{
    NSArray *scribbleDataPathsArray=[self scribbleThumbnailPaths];
    return scribbleDataPathsArray.count;
}
/*! MacBook Pro 2015-01-16 15:06 编辑
 *  @brief  根据索引获取缩略图的方法
 *
 *  @param index 索引
 *
 *  @return 对应的缩略图
 *
 *  @since
 */
-(UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index{
    ScribbleThumbnailViewImageProxy *loadScribbleThumnail=nil;
    NSArray *scribbleThumnailPathsArray=[self scribbleThumbnailPaths];
    NSArray *scribblePathsArray=[self scribbleDataPaths];
    //load scribble thumbnail from the path indicated
    NSString *scribleThumbnail=[scribbleThumnailPathsArray objectAtIndex:index];
    NSString *scribblePath=[scribblePathsArray objectAtIndex:index];
    if(scribleThumbnail){
        loadScribbleThumnail=[[ScribbleThumbnailViewImageProxy alloc]init];
        [loadScribbleThumnail setImagepath:[kScribbleThumbnailPath stringByAppendingPathComponent:scribleThumbnail]];
        [loadScribbleThumnail setScribblePath:[kScribbleDataPath stringByAppendingPathComponent:scribblePath]];
        
        //执行打开的命令
        OpenScribbleCommand *touchCommand=[[OpenScribbleCommand alloc]initWithScribbleSource:loadScribbleThumnail];
        [loadScribbleThumnail setTouchCommand:touchCommand];
    }
    return loadScribbleThumnail;
    
}
-(Scribble *)scribbleAtIndex:(NSInteger)index{
    Scribble *loadScribble=nil;
    NSArray *scribbleDataPathsArray=[self scribbleThumbnailPaths];
    NSString *scribblePath=[scribbleDataPathsArray objectAtIndex:index];
    if(scribblePath){
        NSFileManager *fileManager=[NSFileManager defaultManager];
        NSData *scribbleData=[fileManager contentsAtPath:[kScribbleDataPath stringByAppendingPathComponent:scribblePath]];
        ScribbleMemento *scribbleMemento=[ScribbleMemento mementoWithData:scribbleData];
        loadScribble=[Scribble scribbleWithMemento:scribbleMemento];
    }
    return loadScribble;
}


#pragma mark
#pragma mark--Private Methods
-(NSString *)scribbleDataPath{
  //懒加载scribble data
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:kScribbleDataPath]){
        NSFileManager *fileManager=[NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:kScribbleDataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
        
    }
    return kScribbleDataPath;
}
/*! MacBook Pro 2015-01-16 14:59 编辑
 *  @brief  获取保存缩略图的路径
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(NSString *)scribbleThumbnailPath{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:kScribbleThumbnailPath]){
        NSFileManager *fileManager=[NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return kScribbleThumbnailPath;
}

/*! MacBook Pro 2015-01-16 15:02 编辑
 *  @brief  获取缩略图的文件个数
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(NSArray *)scribbleThumbnailPaths{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleThumbnailPathsArray=[fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath] error:&error];
    
    return scribbleThumbnailPathsArray;
}

-(NSArray *)scribbleDataPaths{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleDataPathsArray=[fileManager contentsOfDirectoryAtPath:[self scribbleDataPath] error:&error];
    return scribbleDataPathsArray;
}

@end


























