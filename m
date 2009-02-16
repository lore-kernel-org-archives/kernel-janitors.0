From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 16 Feb 2009 12:44:28 +0000
Subject: Re: [PATCH] drivers/char/bsr.c: Storage class should be before const
Message-Id: <alpine.LNX.1.10.0902161344170.18110@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209210108.GA7044@xenon.distanz.ch>
In-Reply-To: <20090209210108.GA7044@xenon.distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 9 Feb 2009, Tobias Klauser wrote:

> The C99 specification states in section 6.11.5:
> 
> The placement of a storage-class specifier other than at the
> beginning of the declaration specifiers in a declaration is an
> obsolescent feature.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  drivers/char/bsr.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
> index f6094ae..140ea10 100644
> --- a/drivers/char/bsr.c
> +++ b/drivers/char/bsr.c
> @@ -140,7 +140,7 @@ static int bsr_open(struct inode * inode, struct file * filp)
>  	return 0;
>  }
>  
> -const static struct file_operations bsr_fops = {
> +static const struct file_operations bsr_fops = {
>  	.owner = THIS_MODULE,
>  	.mmap  = bsr_mmap,
>  	.open  = bsr_open,

This doesn't seem to be picked by anyone for current -next/-mmotm, I have
applied it to trivial tree. Thanks,

-- 
Jiri Kosina
SUSE Labs
