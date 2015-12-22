From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 18:22:50 +0000
Subject: Re: [patch] usb: gadget: f_midi: missing unlock on error path
Message-Id: <567994FA.5080309@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151221132017.GB27286@mwanda>
In-Reply-To: <20151221132017.GB27286@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> We added a new error path to this function and we forgot to drop the lock.
> 
> Fixes: e1e3d7ec5da3 ('usb: gadget: f_midi: pre-allocate IN requests')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
> index fb1fe96d..92b9ec8 100644
> --- a/drivers/usb/gadget/function/f_midi.c
> +++ b/drivers/usb/gadget/function/f_midi.c
> @@ -1213,8 +1213,10 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
>  	midi->in_last_port = 0;
>  
>  	status = kfifo_alloc(&midi->in_req_fifo, midi->qlen, GFP_KERNEL);
> -	if (status)
> +	if (status) {
> +		mutex_unlock(&opts->lock);
>  		goto setup_fail;
> +	}
>  
>  	++opts->refcnt;
>  	mutex_unlock(&opts->lock);

How do you think about to move this unlock call and the one that belongs to
the handling of a kstrdup() failure below the shown jump target?

Regards,
Markus
