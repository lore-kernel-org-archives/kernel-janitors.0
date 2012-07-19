From: Christian Riesch <christian.riesch@omicron.at>
Date: Thu, 19 Jul 2012 11:57:12 +0000
Subject: Re: [wireless-next:for-davem 30/99] ERROR: ".phy_disconnect" [drivers/net/usb/asix.ko] undefined!
Message-Id: <1342699032-13704-1-git-send-email-christian.riesch@omicron.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120719101701.GA13917@localhost>
In-Reply-To: <20120719101701.GA13917@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Thu, 19 Jul 2012 18:17:01 +0800 Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Christian,
>
> Kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git for-davem
> head:   ddbe503203855939946430e39bae58de11b70b69
> commit: 16626b0cc3d5afe250850f96759b241f8a403b52 [30/99] asix: Add a new driver for the AX88172A
> config: powerpc-ps3_defconfig (attached as .config)
>
> The module references lots of NOT exported functions:
>
> ERROR: ".phy_disconnect" [drivers/net/usb/asix.ko] undefined!

Thanks! Since commit 16626b0cc3d5afe250850f96759b241f8a403b52 the
asix.ko module (CONFIG_USB_NET_AX8817X) requires phylib. I think I
should add a "select PHYLIB" to this option in drivers/net/usb/Kconfig.

I'll submit a patch to netdev.

Regards, Christian

> ERROR: ".genphy_resume" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".mdiobus_register" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_stop" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_mii_ioctl" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".mdiobus_alloc_size" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_print_status" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_connect" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".mdiobus_unregister" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_start" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_ethtool_gset" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_ethtool_sset" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".phy_start_aneg" [drivers/net/usb/asix.ko] undefined!
> ERROR: ".mdiobus_free" [drivers/net/usb/asix.ko] undefined!
