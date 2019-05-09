From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 May 2019 09:18:16 +0000
Subject: Re: [bug report] phy: renesas: phy-rcar-gen2: Add support for r8a77470
Message-Id: <20190509091815.GZ2239@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503131010.GJ29695@mwanda>
In-Reply-To: <20190503131010.GJ29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

That check hasn't been released.  (It marks every "if (foo > bar) " as
off by one unless it can be proved as okay...

On Tue, May 07, 2019 at 06:54:10AM +0000, Biju Das wrote:
> biju@be1yocto:/data/biju/linux-next$ /data/biju/smatch/smatch_scripts/kchecker drivers/phy/renesas/
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   CHECK   drivers/phy/renesas/phy-rcar-gen2.c
> drivers/phy/renesas/phy-rcar-gen2.c:354 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen2.c:360 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen2.c:409 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen2.c:420 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
>   CHECK   drivers/phy/renesas/phy-rcar-gen3-usb2.c
> drivers/phy/renesas/phy-rcar-gen3-usb2.c:602 rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen3-usb2.c:670 rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
> biju@be1yocto:/data/biju/linux-next$

Are you using the latest Smatch code?  I'm trying to figure out how to
reproduce these false and it feels like it should be really easy to do
a fresh clone and clean kernel tree but I can't make it work.

I got them for a while, but I fixed it and I thought I had pushed all
the fixes...

regards,
dan carpenter
