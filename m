From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Fri, 08 Nov 2013 05:06:52 +0000
Subject: Re: [patch] fat: double unlock on error path
Message-Id: <87zjpfv5w3.fsf@devron.myhome.or.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107074108.GB21844@elgon.mountain>
In-Reply-To: <20131107074108.GB21844@elgon.mountain> (Dan Carpenter's message
	of "Thu, 7 Nov 2013 10:41:08 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> There is a stray unlock here which was not intended.  I have removed it.
>
> Fixes: 3f9f3dfb5755 ('fat: add fat_fallocate operation')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index 03f716f..befedee 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -257,10 +257,8 @@ static long fat_fallocate(struct file *file, int mode,
>  		goto error;
>  
>  	err = inode_newsize_ok(inode, (len + offset));
> -	if (err) {
> -		mutex_unlock(&inode->i_mutex);
> +	if (err)
>  		goto error;
> -	}
>  
>  	if (mode & FALLOC_FL_KEEP_SIZE) {
>  		/* First compute the number of clusters to be allocated */

Right. Namjae, please include this fix to patchset at next time.

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
