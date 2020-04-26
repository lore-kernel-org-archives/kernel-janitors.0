From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 26 Apr 2020 19:50:06 +0000
Subject: Re: [PATCH] firmware: stratix10-svc: Fix some error handling paths in 'stratix10_svc_drv_probe()'
Message-Id: <cf6ec3b6-ac2e-e076-2a48-2ed25db4c0f1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426190307.40840-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200426190307.40840-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Alan Tull <atull@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <mdf@kernel.org>, Richard Gong <richard.gong@linux.intel.com>

> If an error occurs after calling 'kfifo_alloc()', the allocated memory
> should be freed with 'kfifo_free()', as already done in the remove
> function.

I suggest to reconsider software development consequences around
another implementation detail for such exception handling.


…
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -1043,24 +1043,31 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
…
>  	svc = devm_kzalloc(dev, sizeof(*svc), GFP_KERNEL);
…
> +	if (!svc) {
> +		ret = -ENOMEM;
> +		goto err_free_kfifo;
> +	}

Would you like to take the possibility into account to avoid
the duplicate specification of this error code assignment
by adding another jump target?

-		return -ENOMEM;
+		goto e_nomem;


>+	return 0;
>+

+e_nomem:
+	ret = -ENOMEM;

>+err_free_kfifo:
>+	kfifo_free(&controller->svc_fifo);
> 	return ret;
>  }


By the way:
How do you think about to omit the error message “failed to allocate FIFO”
for a failed call of the function “kfifo_alloc”?

Regards,
Markus
