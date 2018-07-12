From: Jan Harkes <jaharkes@cs.cmu.edu>
Date: Thu, 12 Jul 2018 15:31:00 +0000
Subject: Re: [PATCH] fs/coda: potential buffer overflow in coda_psdev_write()
Message-Id: <20180712153100.ml2vkv43orrymnax@cs.cmu.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712123255.rkcszmwdmrloxaki@kili.mountain>
In-Reply-To: <20180712123255.rkcszmwdmrloxaki@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 12, 2018 at 03:32:56PM +0300, Dan Carpenter wrote:
> "dcbuf" is a union that is "size" bytes large.  We ensure that "nbytes"
> is large enough to hold the smallest member of the union, but if we
> require a larger union member then then we could access beyond the end
> of the allocated memory in coda_downcall().

I don't see where nbytes is set to hold the smallest member of the
union.

    // nbytes is how much userspace is trying to write
    union outputArgs *dcbuf;
    int size = sizeof(*dcbuf);      // maximum size of the union
    ...
    if (nbytes > size) {
        ...
        nbytes = size;              // truncate nbytes if the write was
                                    // larger than our buffer
    }
    CODA_ALLOC(*dcbuf, union outputArgs *, nbytes);
    copy_from_user(dcbuf, buf, nbytes);


The test between the sizeof and the truncation of nbytes in the
ellipsized part of the code does test for the smallest size of the
union, but it has a 'goto out;' when it is hit because if the received
message is smaller than the message header, the code that would run
after the copy_from_user would look at fields that were never passed by
userspace.

Even if we allocate size instead of nbytes, we still wouldn't
copy_from_user more than nbytes anyway.

Jan

> The union is quite small so we can allocate enough space so everything
> fits.  The CODA_ALLOC() macro calls kzalloc() which means the extra
> memory is just zeroed and it's fine.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/coda/psdev.c b/fs/coda/psdev.c
> index c5234c21b539..910d57e576e2 100644
> --- a/fs/coda/psdev.c
> +++ b/fs/coda/psdev.c
> @@ -124,7 +124,7 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
>  				hdr.opcode, hdr.unique);
>  		        nbytes = size;
>  		}
> -		CODA_ALLOC(dcbuf, union outputArgs *, nbytes);
> +		CODA_ALLOC(dcbuf, union outputArgs *, size);
>  		if (copy_from_user(dcbuf, buf, nbytes)) {
>  			CODA_FREE(dcbuf, nbytes);
>  			retval = -EFAULT;
> 
