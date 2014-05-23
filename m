From: =?ISO-8859-1?Q?Philippe_R=E9tornaz?= <philippe.retornaz@gmail.com>
Date: Fri, 23 May 2014 06:50:54 +0000
Subject: Re: [PATCH] ARM: imx: introduce function imx_free_mx3_camera
Message-Id: <537EEFCE.8000201@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400781080-6117-1-git-send-email-emilgoode@gmail.com>
 <20140522181024.GA20155@pengutronix.de>
In-Reply-To: <20140522181024.GA20155@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hi Uwe

Le 22/05/2014 20:10, Uwe Kleine-K=F6nig a =E9crit :
[...]
> Today all imx machines should get their devices from an oftree, so
> the various functions to add devices started to bitrot. Moreover
> there is no reason to remove a device once it was successfully
> added.
>
> Note that platform_device_register_full has the same problem (i.e.
> pdev->dev.dma_mask isn't freed when the last reference to a device
> is dropped.) You'd do a better deed if you picked up
> http://thread.gmane.org/gmane.linux.kernel/1613364/focus=1635995
> instead of fixing dead code.

I would like to object that all imx machine should now boot from devicetree.
mx31moboard is still used and still get its kernel updated.
It has never booted from devicetree, and IIRC the "deal" when devicetree
was enforced on ARM was that all previous boards where still supported
and would not get removed.
So please don't kick us out of the kernel so fast :)

Thanks !

Philippe
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
