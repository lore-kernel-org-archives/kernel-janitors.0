From: Wim Van Sebroeck <wim@iguana.be>
Date: Wed, 23 Feb 2011 20:59:44 +0000
Subject: Re: [patch] watchdog: sch311x_wdt: fix printk condition
Message-Id: <20110223205944.GP3790@infomag.iguana.be>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110223202601.GH19898@bicker>
In-Reply-To: <20110223202601.GH19898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> "=" has higher precedence than "&".  Since
> if (sch311x_sio_inb(sio_config_port, 0x30) & (0x01 = 0)) is always
> false the message is never printed.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Btw, is this printk() even worth printing?

Patch will be added.
About the printk -> need to look into the data sheet for that... We might need to exit the driver or activate it or ...

Kind regards,
Wim.

