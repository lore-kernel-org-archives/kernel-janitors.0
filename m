From: Dan Carpenter <error27@gmail.com>
Date: Mon, 06 Sep 2010 10:11:38 +0000
Subject: Re: [PATCH 06/14] staging: rtl8192u: improve error path
Message-Id: <20100906101138.GA31249@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711561-7332-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1283711561-7332-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Julia Lawall <julia@diku.dk>, Ben Hutchings <ben@decadent.org.uk>, Mike Gilks <mike.kernel@gilksonline.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, Sep 05, 2010 at 10:32:41PM +0400, Kulikov Vasiliy wrote:
> +fail2:
> +	rtl8192_down(dev);
> +	if (priv->pFirmware) {
> +		kfree(priv->pFirmware);
> +		priv->pFirmware = NULL;
> +	}
> +	rtl8192_usb_deleteendpoints(dev);
> +	destroy_workqueue(priv->priv_wq);
> +	mdelay(10);

What's this delay for?

regards,
dan carpenter

>  fail:
>  	free_ieee80211(dev);

