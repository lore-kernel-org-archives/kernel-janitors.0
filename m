From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 14 Feb 2019 07:04:43 +0000
Subject: Re: [PATCH] fs/coda: get rid of CODA_ALLOC()
Message-Id: <alpine.DEB.2.21.1902140804170.2466@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190214065848.GB21768@kadam>
In-Reply-To: <20190214065848.GB21768@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@telemann.coda.cs.cmu.edu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Thu, 14 Feb 2019, Dan Carpenter wrote:

> These days we have kvzalloc() so we can delete CODA_ALLOC().

Maybe it would be better to get rid fo CODA_FREE as well?

julia

>
> I made a couple related changes in coda_psdev_write().  First, I
> added some error handling to avoid a NULL dereference if the allocation
> failed.  Second, I used kvmalloc() instead of kvzalloc() because we
> copy over the memory on the next line so there is no need to zero it
> first.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/coda/coda_linux.h | 10 ----------
>  fs/coda/psdev.c      |  6 +++++-
>  fs/coda/upcall.c     |  4 ++--
>  3 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/fs/coda/coda_linux.h b/fs/coda/coda_linux.h
> index 126155cadfa9..1ea9521e79d7 100644
> --- a/fs/coda/coda_linux.h
> +++ b/fs/coda/coda_linux.h
> @@ -63,16 +63,6 @@ unsigned short coda_flags_to_cflags(unsigned short);
>  void coda_sysctl_init(void);
>  void coda_sysctl_clean(void);
>
> -#define CODA_ALLOC(ptr, cast, size) do { \
> -    if (size < PAGE_SIZE) \
> -        ptr = kzalloc((unsigned long) size, GFP_KERNEL); \
> -    else \
> -        ptr = (cast)vzalloc((unsigned long) size); \
> -    if (!ptr) \
> -	pr_warn("kernel malloc returns 0 at %s:%d\n", __FILE__, __LINE__); \
> -} while (0)
> -
> -
>  #define CODA_FREE(ptr, size) kvfree((ptr))
>
>  /* inode to cnode access functions */
> diff --git a/fs/coda/psdev.c b/fs/coda/psdev.c
> index c5234c21b539..49d44a485c9a 100644
> --- a/fs/coda/psdev.c
> +++ b/fs/coda/psdev.c
> @@ -124,7 +124,11 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
>  				hdr.opcode, hdr.unique);
>  		        nbytes = size;
>  		}
> -		CODA_ALLOC(dcbuf, union outputArgs *, nbytes);
> +		dcbuf = kvmalloc(nbytes, GFP_KERNEL);
> +		if (!dcbuf) {
> +			retval = -ENOMEM;
> +			goto out;
> +		}
>  		if (copy_from_user(dcbuf, buf, nbytes)) {
>  			CODA_FREE(dcbuf, nbytes);
>  			retval = -EFAULT;
> diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
> index 1175a1722411..203f029bcdc3 100644
> --- a/fs/coda/upcall.c
> +++ b/fs/coda/upcall.c
> @@ -46,7 +46,7 @@ static void *alloc_upcall(int opcode, int size)
>  {
>  	union inputArgs *inp;
>
> -	CODA_ALLOC(inp, union inputArgs *, size);
> +	inp = kvzalloc(size, GFP_KERNEL);
>          if (!inp)
>  		return ERR_PTR(-ENOMEM);
>
> @@ -743,7 +743,7 @@ static int coda_upcall(struct venus_comm *vcp,
>  	sig_req = kmalloc(sizeof(struct upc_req), GFP_KERNEL);
>  	if (!sig_req) goto exit;
>
> -	CODA_ALLOC((sig_req->uc_data), char *, sizeof(struct coda_in_hdr));
> +	sig_req->uc_data = kvzalloc(sizeof(struct coda_in_hdr), GFP_KERNEL);
>  	if (!sig_req->uc_data) {
>  		kfree(sig_req);
>  		goto exit;
> --
> 2.17.1
>
>
