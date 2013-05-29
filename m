From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 29 May 2013 22:28:26 +0000
Subject: Re: [patch] minix: bug widening a binary "not" operation
Message-Id: <20130529152826.043e95791122bbd39fc9d005@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130516075148.GA7494@elgon.mountain>
In-Reply-To: <20130516075148.GA7494@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 16 May 2013 10:51:49 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "chunk_size" is an unsigned int and "pos" is an unsigned long.  The
> "& ~(chunk_size-1)" operation clears the high 32 bits unintentionally.
> 
> The ALIGN() macro does the correct thing.
> 
> ...
>
> @@ -95,7 +95,7 @@ static int minix_readdir(struct file * filp, void * dirent, filldir_t filldir)
>  	char *name;
>  	__u32 inumber;
>  
> -	pos = (pos + chunk_size-1) & ~(chunk_size-1);
> +	pos = ALIGN(pos, chunk_size);
>  	if (pos >= inode->i_size)
>  		goto done;
>  

I'm suspecting there aren't many minix filesystems out there with a >4G
directory ;)

But we should fix it to set a good example, and to quieten
whatever-tool-i-suspect-you-were-using(?).
