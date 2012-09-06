From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 06 Sep 2012 08:45:35 +0000
Subject: Re: [omap-dss2:work:omap5-dt 83/133] include/linux/of.h:318:1: error: unknown type name 'device_node
Message-Id: <20120906084535.GA24578@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50485535.6060203@ti.com>
In-Reply-To: <50485535.6060203@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Tomi,

On Thu, Sep 06, 2012 at 10:55:47AM +0300, Tomi Valkeinen wrote:
> Hi Fengguang,
>=20
> Why are you compiling work/omap5-dt branch? That's not a stable one.

Sorry, shall I skip all of you work/* branches?

Thanks,
Fengguang

> But yes, the patch is Peter's, even if it's my git tree, so he was the
> correct one to blame ;).
>=20
>  Tomi
>=20
> On Thu, 2012-09-06 at 10:48 +0300, Peter Ujfalusi wrote:
> > Hi,
> >=20
> > On 09/06/2012 06:51 AM, Fengguang Wu wrote:
> > > Hi Peter,
> > >=20
> > > FYI, kernel build failed on
> >=20
> > Thank you for report. AFAIK this is a work in progress tree for OMAP DS=
S2
> > maintained by Tomi Valkeinen (I have put him to CC).
> >=20
> > Regards,
> > P=C3=A9ter
> >=20
> > >=20
> > > tree:   git://gitorious.org/linux-omap-dss2/linux work/omap5-dt
> > > head:   73fc80a0ac6b4a62eab3ce20150167f5be0233e7
> > > commit: 3fc0d2ee0ac2c9f927b4e4aa5aca915d85ec56eb [83/133] dt: Add emp=
ty of_find_node_by_name() function
> > > config: x86_64-allyesdebian (attached as .config)
> > >=20
> > > All related error/warning messages:
> > >=20
> > > In file included from arch/x86/kernel/irq.c:7:0:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from arch/x86/include/asm/prom.h:17:0,
> > >                  from arch/x86/kernel/setup.c:115:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from arch/x86/include/asm/prom.h:17:0,
> > >                  from arch/x86/kernel/irqinit.c:27:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from arch/x86/kernel/rtc.c:10:0:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from include/linux/i2c.h:36:0,
> > >                  from include/linux/fb.h:5,
> > >                  from fs/compat_ioctl.c:44:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from kernel/irq/irqdomain.c:11:0:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from drivers/ata/sata_mv.c:68:0:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from drivers/base/core.c:21:0:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from include/linux/i2c.h:36:0,
> > >                  from include/linux/fb.h:5,
> > >                  from arch/x86/video/fbdev.c:9:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from include/asm-generic/gpio.h:7:0,
> > >                  from include/linux/gpio.h:48,
> > >                  from drivers/gpio/gpiolib.c:10:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > --
> > > In file included from include/asm-generic/gpio.h:7:0,
> > >                  from include/linux/gpio.h:48,
> > >                  from drivers/gpio/devres.c:18:
> > > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > > ..
> > >=20
> > > ---
> > > 0-DAY kernel build testing backend         Open Source Technology Cen=
tre
> > > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporat=
ion
> > >=20
> >=20
> >=20
>=20


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
