From: Jens Axboe <jaxboe@fusionio.com>
Date: Mon, 11 Oct 2010 19:42:23 +0000
Subject: Re: [patch] ps3disk: passing wrong variable to bvec_kunmap_irq()
Message-Id: <4CB3689F.1050601@fusionio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011191335.GH5851@bicker>
In-Reply-To: <20101011191335.GH5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "cbe-oss-dev@lists.ozlabs.org" <cbe-oss-dev@lists.ozlabs.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Geoff Levand <geoff@infradead.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

On 2010-10-11 21:13, Dan Carpenter wrote:
> This should pass "buf" to bvec_kunmap_irq() instead of "bv".  The api is
> like kmap_atomic() instead of kmap().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
> index e9da874..03688c2 100644
> --- a/drivers/block/ps3disk.c
> +++ b/drivers/block/ps3disk.c
> @@ -113,7 +113,7 @@ static void ps3disk_scatter_gather(struct ps3_storage_device *dev,
>  			memcpy(buf, dev->bounce_buf+offset, size);
>  		offset += size;
>  		flush_kernel_dcache_page(bvec->bv_page);
> -		bvec_kunmap_irq(bvec, &flags);
> +		bvec_kunmap_irq(buf, &flags);
>  		i++;
>  	}
>  }

Thanks applied, that bug is all too common.

-- 
Jens Axboe

