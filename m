From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Dec 2018 11:51:13 +0000
Subject: Re: [PATCH] ecryptfs: re-order a condition for static checkers
Message-Id: <20181214115113.GM10347@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Can we merge this patch?  KASAN will probably complain about this as
well, I think...

regards,
dan carpenter

On Wed, Aug 22, 2018 at 01:43:59PM +0300, Dan Carpenter wrote:
> Static checkers complain that we are using "s->i" as an offset before
> we check whether it is within bounds.  It doesn't matter much but we
> can easily swap the order of the checks to make everyone happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index e74fe84d0886..624ff4409c61 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -1063,8 +1063,9 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
>  		       "rc = [%d]\n", __func__, rc);
>  		goto out_free_unlock;
>  	}
> -	while (s->decrypted_filename[s->i] != '\0'
> -	       && s->i < s->block_aligned_filename_size)
> +
> +	while (s->i < s->block_aligned_filename_size &&
> +	       s->decrypted_filename[s->i] != '\0')
>  		s->i++;
>  	if (s->i = s->block_aligned_filename_size) {
>  		printk(KERN_WARNING "%s: Invalid tag 70 packet; could not "
