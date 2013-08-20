From: Ian Abbott <abbotti@mev.co.uk>
Date: Tue, 20 Aug 2013 10:02:45 +0000
Subject: Re: [patch] staging: comedi: pcmuio: remove an unneeded check
Message-Id: <52133EC5.30602@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130820090013.GC20170@elgon.mountain>
In-Reply-To: <20130820090013.GC20170@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2013-08-20 10:00, Dan Carpenter wrote:
> "devpriv" is non-NULL at this point.  We dereference it earlier in the
> function and the inconsistent checking upsets static checkers.  We don't
> need to check "devpriv->sprivs" because kfree() accepts NULL pointers.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/comedi/drivers/pcmuio.c b/drivers/staging/comedi/drivers/pcmuio.c
> index f942455..a779062 100644
> --- a/drivers/staging/comedi/drivers/pcmuio.c
> +++ b/drivers/staging/comedi/drivers/pcmuio.c
> @@ -676,8 +676,7 @@ static void pcmuio_detach(struct comedi_device *dev)
>   		if (devpriv->asics[i].irq)
>   			free_irq(devpriv->asics[i].irq, dev);
>   	}
> -	if (devpriv && devpriv->sprivs)
> -		kfree(devpriv->sprivs);
> +	kfree(devpriv->sprivs);
>   	comedi_legacy_detach(dev);
>   }
>
>

Actually, the function is buggy anyway as devpriv might be NULL 
(pcmuio_detach() is called even if pcmuio_attach() returns an error).

So let's drop this patch and I'll post a patch to fix the bug.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
