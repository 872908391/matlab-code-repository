#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>    
#include <sys/stat.h>    
#include <fcntl.h>
#include <string.h>

#define size 20

void *CopyFile(void *src)
{
    unsigned char buff[1024];
    char* mkfifo  = "FIFO";
    int rfd = open(src,O_RDONLY);
    int wrd = open(mkfifo,O_WRONLY, 0666);
    if(rfd < 0||wrd < 0)
    {
        perror("CopyFile: open file error\n");
        exit(1);
    }
    lseek(rfd, 0, SEEK_SET);
    int real_read_len;
    while((real_read_len = read(rfd, buff, sizeof(buff))) > 0)
    {
        write(wrd, buff, real_read_len);
    }
    close(rfd);
    close(wrd);
    return 0;
}

void *WriteFile(void *target)
{
    unsigned char buff[1024];
    char* mkfifo = "FIFO";
    int rfd = open(mkfifo,O_RDONLY);
    int wrd = open(target,O_WRONLY | O_CREAT, 0666);
    if(rfd < 0||wrd < 0)
    {
        perror("WriteFile: open file error\n");
        exit(1);
    }
    lseek(rfd, 0, SEEK_SET);
    int real_read_len;
    while((real_read_len = read(rfd, buff, sizeof(buff))) > 0)
    {
        write(wrd, buff, real_read_len);
    }
    close(rfd);
    close(wrd);
    return 0;   
}

int main(int argc, char *argv[])
{
    char* src = (char*)malloc(sizeof(char)*size);
    char* target = (char*)malloc(sizeof(char)*size);
    strcpy(src,argv[1]);
    strcpy(target,argv[2]);
    mkfifo("FIFO",0666);
    pthread_t tid1, tid2;
    int ret = pthread_create(&tid1, NULL, CopyFile, src);
    int wet = pthread_create(&tid2, NULL, WriteFile, target);
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    // unlink("FIFO");
    free(target);
    free(src);
    return 0;
}

