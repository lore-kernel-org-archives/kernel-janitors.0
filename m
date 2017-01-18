From: Viacheslav Dubeyko <slava@dubeyko.com>
Date: Wed, 18 Jan 2017 17:28:58 +0000
Subject: Re: [patch resend] hfs: fix fix hfs_readdir()
Message-Id: <1484760538.27533.37.camel@dubeyko.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170118111320.GA23725@mwanda>
In-Reply-To: <20170118111320.GA23725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, Bob Copeland <me@bobcopeland.com>, Boaz Harrosh <ooo@electrozaur.com>, Deepa Dinamani <deepa.kernel@gmail.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2017-01-18 at 14:13 +0300, Dan Carpenter wrote:
> I was looking through static analysis warnings and there is a bug
> here
> that goes all the way back to the start of git.  Basically we're
> copying
> the pointer and nearby garbage instead of the data the fd.key pointer
> is
> pointing to.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I sent this a year ago, and we had a thread about it, but in the end
> decided that the original patch was correct.  Not tested.
> 
> diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
> index 5de5c48..75b2542 100644
> --- a/fs/hfs/dir.c
> +++ b/fs/hfs/dir.c
> @@ -169,7 +169,7 @@ static int hfs_readdir(struct file *file, struct
> dir_context *ctx)
>  	 * Can be done after the list insertion; exclusion with
>  	 * hfs_delete_cat() is provided by directory lock.
>  	 */
> -	memcpy(&rd->key, &fd.key, sizeof(struct hfs_cat_key));
> +	memcpy(&rd->key, &fd.key->cat, sizeof(struct hfs_cat_key));
>  out:
>  	hfs_find_exit(&fd);
>  	return err;

Looks good.

Reviewed-by: Vyacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Vyacheslav Dubeyko.

