From: Felipe Balbi <balbi@ti.com>
Date: Mon, 17 Sep 2012 18:00:17 +0000
Subject: Re: [omap:tmp-merge 31/47] drivers/mfd/twl-core.c:49:22: fatal error: plat/cpu.h: No such file or di
Message-Id: <20120917180014.GA15518@arwen.pp.htv.fi>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120917003526.GB12394@localhost>
 <20120917165643.GL4521@atomide.com>
In-Reply-To: <20120917165643.GL4521@atomide.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 17, 2012 at 09:56:43AM -0700, Tony Lindgren wrote:
> * Fengguang Wu <fengguang.wu@intel.com> [120916 17:41]:
> > Hi Tony,
> >=20
> > FYI, kernel build failed on
> >=20
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap=
=2Egit tmp-merge
> > head:   a742996f4643b4e9612fe081d146035964cfbd87
> > commit: 7d7e1eba7e92c2f9c76db80adc24836e7a114bfb [31/47] ARM: OMAP2+: P=
repare for irqs.h removal
> > config: x86_64-randconfig-s331 (attached as .config)
> >=20
> > All related error/warning messages:
> >=20
> > drivers/mfd/twl-core.c:49:22: fatal error: plat/cpu.h: No such file or =
directory
> > compilation terminated.
> >=20
> > vim +49 drivers/mfd/twl-core.c
> >     44	#include <linux/regulator/machine.h>
> >     45=09
> >     46	#include <linux/i2c.h>
> >     47	#include <linux/i2c/twl.h>
> >     48=09
> >   > 49	#include <plat/cpu.h>
> >     50=09
> >     51	#include "twl-core.h"
> >     52=09
> >     53	/*
> >     54	 * The TWL4030 "Triton 2" is one of a family of a multi-function=
 "Power
>=20
> OK thanks for letting me know. That include needs to be ifdeffed until
> we remove all cpu_is_omap usage from drivers. I'll take a look and will
> also check if other drivers may have the same issue.

the only use of cpu_is_* in that driver is related to the osc_ck clock
name. Isn't this enough ?

=46rom: Felipe Balbi <balbi@ti.com>
Subject: mfd: twl-core: drop cpu_is_* usage


NYET-Signed-off-by: Felipe Balbi <balbi@ti.com>
---

diff --git a/arch/arm/mach-omap2/clock2430_data.c b/arch/arm/mach-omap2/clo=
ck2430_data.c
index cacabb0..b2e6080 100644
--- a/arch/arm/mach-omap2/clock2430_data.c
+++ b/arch/arm/mach-omap2/clock2430_data.c
@@ -1855,7 +1855,7 @@ static struct omap_clk omap2430_clks[] =3D {
 	/* external root sources */
 	CLK(NULL,	"func_32k_ck",	&func_32k_ck,	CK_243X),
 	CLK(NULL,	"secure_32k_ck", &secure_32k_ck, CK_243X),
-	CLK(NULL,	"osc_ck",	&osc_ck,	CK_243X),
+	CLK(NULL,	"osc_sys_ck",	&osc_ck,	CK_243X),
 	CLK(NULL,	"sys_ck",	&sys_ck,	CK_243X),
 	CLK(NULL,	"alt_ck",	&alt_ck,	CK_243X),
 	CLK(NULL,	"mcbsp_clks",	&mcbsp_clks,	CK_243X),
diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index 1c32afe..e4fff17 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -1132,11 +1132,7 @@ static void clocks_init(struct device *dev,
 	u32 rate;
 	u8 ctrl =3D HFCLK_FREQ_26_MHZ;
=20
-#if defined(CONFIG_ARCH_OMAP2) || defined(CONFIG_ARCH_OMAP3)
-	if (cpu_is_omap2430())
-		osc =3D clk_get(dev, "osc_ck");
-	else
-		osc =3D clk_get(dev, "osc_sys_ck");
+	osc =3D clk_get(dev, "osc_sys_ck");
=20
 	if (IS_ERR(osc)) {
 		printk(KERN_WARNING "Skipping twl internal clock init and "
@@ -1147,18 +1143,6 @@ static void clocks_init(struct device *dev,
 	rate =3D clk_get_rate(osc);
 	clk_put(osc);
=20
-#else
-	/* REVISIT for non-OMAP systems, pass the clock rate from
-	 * board init code, using platform_data.
-	 */
-	osc =3D ERR_PTR(-EIO);
-
-	printk(KERN_WARNING "Skipping twl internal clock init and "
-	       "using bootloader value (unknown osc rate)\n");
-
-	return;
-#endif
-
 	switch (rate) {
 	case 19200000:
 		ctrl =3D HFCLK_FREQ_19p2_MHZ;

--=20
balbi

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQV2UuAAoJEIaOsuA1yqREciUP/3iwgm7Iu/WtLMuhQvF7Loiu
bUsQahXdSEitFJ7u4ABujmAz/7UG8DlQ91qeMoJDrL1Ut410O7LjXaAhn8aPTmge
DT3pE8LPgZVX/jvNNuyJXRHSRro01qSbhGLnCHZGA5JQVHY7SaUWV0KQ3US1SpHQ
/l9Jw1905RVnUfc//nfK37OKyn2cqrvj2YhnBl7zEpJokhL3AeCo1ao8PX3YlzJ2
pKv7XTjmAq6kIM2pNEnQwYWmwzqwmLaQHgDotf6eAw9VIjzugAK6LEE+2UAxW/tD
zd942aaqD3asw392S7t8CrU8iYQXudSHm/zENEyN8JMeCFlYisB2E8EfPjeQfqJ2
EqdMojZNZ0YWXeP7tUdX5ErApfb1xzloUfwPEqp3Kj5SW71nRBMwhk34UKiwPcgV
II5IcUIqsCH7zHq0HSx2E4Id8Q1MgtoNYbyeIYKaHd7SxqhUjMhWclZ6nZ2oglKD
hxx6OaEsNMx1Pm1kePnuNnlLN5Ao9pFnfTNvb4PMMPdqXA6Y+xGRNLlMhHCG2zSm
Uo+dLCoUJKxmr/RD7LEKHtpR5YlHxwEpPxL40L9hej2QyonghTPj5YLjnEvkv5CE
/8MnVdjvsLcoGFt0xr27VCj91HMtNu4aDVXovlapEFcAkUyLkvQ6y6tVwC9dlQaB
x0cETv4x8u1CshL7/wNO
=C2mJ
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
