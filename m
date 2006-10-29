From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 29 Oct 2006 19:00:37 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/media/video
Message-Id: <20061029190037.GA4900@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2006 at 10:18:23PM +0200, Eric Sesterhenn wrote:
> --- linux-2.6.19-rc2-git7/drivers/media/video/saa5246a.c.orig
> +++ linux-2.6.19-rc2-git7/drivers/media/video/saa5246a.c
> @@ -80,12 +80,11 @@ static int saa5246a_attach(struct i2c_ad
>  	struct saa5246a_device *t;
>
>  	printk(KERN_INFO "saa5246a: teletext chip found.\n");
> -	client=kmalloc(sizeof(*client), GFP_KERNEL);
> +	client=kmemdup(&client_template, sizeof(*client), GFP_KERNEL);
>  	if(client=NULL)
>  		return -ENOMEM;
>  	client_template.adapter = adap;
>  	client_template.addr = addr;
> -	memcpy(client, &client_template, sizeof(*client));

I've dropped this chunk. Transformation is not identical. OTOH, some
other driver does assignments before kmalloc().

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
