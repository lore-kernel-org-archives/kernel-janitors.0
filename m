From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 31 Aug 2007 11:43:18 +0000
Subject: Re: [patch 3/3] fs/cramfs/inode.c: remove error variable
Message-Id: <46D7FED6.3010005@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200708301737.49018.lists-receive@programmierforen.de>
In-Reply-To: <200708301737.49018.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Andi Drebes wrote:
> This patch removes a variable from fs/cramfs/inode.c that is just used to store
> a return value which is immediately read afterwards.
>
> Tested on an i386 box.
> Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
> ---
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 350680f..42d2cf8 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -372,7 +372,7 @@ static int cramfs_readdir(struct file *filp, void *dirent, filldir_t filldir)
>  		char *name;
>  		ino_t ino;
>  		mode_t mode;
> -		int namelen, error;
> +		int namelen;
>  
>  		mutex_lock(&read_mutex);
>  		de = cramfs_read(sb, OFFSET(inode) + offset, sizeof(*de)+CRAMFS_MAXPATHLEN);
> @@ -398,8 +398,7 @@ static int cramfs_readdir(struct file *filp, void *dirent, filldir_t filldir)
>  				break;
>  			namelen--;
>  		}
> -		error = filldir(dirent, buf, namelen, offset, ino, mode >> 12);
> -		if (error)
> +		if(filldir(dirent, buf, namelen, offset, ino, mode >> 12))
>   
Maybe picky but please leave it as "if (".
Also, is it suppose to mean that if filldir() can do/execute 
(something), "break;" is going to happened? The 'error'-variable has the 
added value of telling the programmer it is an error-condition. So IMHO 
a "!= 0" would be appropriate (or in the range the error-values are in).

Richard Knutsson

