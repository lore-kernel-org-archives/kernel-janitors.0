From: Samuel Ortiz <sameo@linux.intel.com>
Date: Fri, 19 Mar 2010 11:48:36 +0000
Subject: Re: mfd: dereferencing first then checking
Message-Id: <20100319114834.GB3156@sortiz.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100308125522.GA11530@bicker>
In-Reply-To: <20100308125522.GA11530@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Mon, Mar 08, 2010 at 03:55:22PM +0300, Dan Carpenter wrote:
> drivers/mfd/t7l66xb.c +371 t7l66xb_probe(58) warn: variable dereferenced before check 'pdata'
>    338          t7l66xb->irq_base = pdata->irq_base;
> 
>    [snip]
> 
>    371          if (pdata && pdata->enable)
>    372                  pdata->enable(dev);
> 
> Can pdata be null here?  We dereferenced on line 338 without checking.
We should definitely check for pdata being not NULL here.
I fixed that, thanks for spotting it.

Cheers,
Samuel.


> regards,
> dan carpenter

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
