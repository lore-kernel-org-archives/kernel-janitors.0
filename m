From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 19 Aug 2013 11:47:23 +0000
Subject: [PATCH 4/6 v2] usb: musb: dsps: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <alpine.DEB.2.02.1308191346390.2313@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1786006515-1376912843=:2313"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr> <1376902316-18520-5-git-send-email-Julia.Lawall@lip6.fr> <5211FED3.4090102@secomea.dk>
In-Reply-To: <5211FED3.4090102@secomea.dk>
To: =?ISO-8859-15?Q?Svenning_S=F8rensen?= <sss@secomea.dk>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1786006515-1376912843=:2313
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource_byname when the value is passed to
devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,e,e1;
expression ret !=3D 0;
identifier l;
@@

  res =3D platform_get_resource_byname(...);
- if (res =3D=3D NULL) { ... \(goto l;\|return ret;\) }
  e =3D devm_ioremap_resource(e1, res);
// </smpl>

This patch also adjusts the error-handling code on the call to
devm_ioremap_resource to check the right value, noticed by Svenning S=F8ren=
sen.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: Fixed the bug on the test of the result of devm_ioremap_resource

 drivers/usb/musb/musb_dsps.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 4ffbaac..e60be6f 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -357,12 +357,9 @@ static int dsps_musb_init(struct musb *musb)
 	u32 rev, val;

 	r =3D platform_get_resource_byname(parent, IORESOURCE_MEM, "control");
-	if (!r)
-		return -EINVAL;
-
 	reg_base =3D devm_ioremap_resource(dev, r);
-	if (!musb->ctrl_base)
-		return -EINVAL;
+        if (IS_ERR(reg_base))
+		return PTR_ERR(reg_base);
 	musb->ctrl_base =3D reg_base;

 	/* NOP driver needs change if supporting dual instance */
--8323329-1786006515-1376912843=:2313--
