From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 23 Oct 2006 17:39:24 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling
Message-Id: <1161625164.21701.18.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
In-Reply-To: <20061023171910.GA23714@hmsreliant.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, akpm@osdl.org, benh@kernel.crashing.org, maxk@qualcomm.com, linux-kernel@vger.kernel.org

Ar Llu, 2006-10-23 am 13:19 -0400, ysgrifennodd Neil Horman:
> +	for_each_online_node(node) {
> +		if(timers[node] != NULL)
> +			kfree(timers[node]);
> +	}

The if test appears to be redundant as kfree(NULL) is a valid no-op.

> +	if (misc_register(&hp_sdc_rtc_dev) != 0)
> +		printk(KERN_INFO "Could not register misc. dev for sdc\n");

Many users will misconstrue this has a hard disk name - is there a
better name to use.

>  	if (ret)
>  		printk(KERN_ERR "tun: Can't register misc device %d\n", TUN_MINOR);

These all really show that we should pass the name into the misc
register and do the printk there to cut down on random name variants and
kernel size. Separate problem, just noting it in case someone feels
inspired 8)

Alan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
