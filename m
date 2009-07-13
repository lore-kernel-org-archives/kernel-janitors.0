From: Peter Huewe <PeterHuewe@gmx.de>
Date: Mon, 13 Jul 2009 20:56:16 +0000
Subject: Re: [PATCH] media/omap: adding __init/__exit macros to lcd_drivers
Message-Id: <200907132256.17036.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907031439.40456.PeterHuewe@gmx.de>
In-Reply-To: <200907031439.40456.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jiri Kosina <trivial@kernel.org>
Cc: imre.deak@nokia.com, linux-omap@vger.kernel.org, linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Freitag 03 Juli 2009 14:39:40 schrieb Peter H=FCwe:
> From: Peter Huewe <peterhuewe@gmx.de>
>
> Trivial patch which adds the __init and __exit macros to the module_init /
> module_exit functions to several files in drivers/video/omap/
>
> linux version 2.6.31-rc1 - linus git tree
>
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Hi Jini,
any updates on this patch yet ? :)

Thanks,
Peter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
