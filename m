From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 25 Aug 2012 19:57:08 +0000
Subject: [PATCH 5/6] drivers/staging/crystalhd/crystalhd_lnx.c: adjust inconsistent IS_ERR and PTR_ERR
Message-Id: <1345924629-16584-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Naren Sankar <nsankar@broadcom.com>
Cc: kernel-janitors@vger.kernel.org, Jarod Wilson <jarod@wilsonet.com>, Scott Davilla <davilla@4pi.com>, Manu Abraham <abraham.manu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Change the call to PTR_ERR to access the value just tested by IS_ERR.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
@@

(
if (IS_ERR(e)) { ... PTR_ERR(e) ... }
|
if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
|
*if (IS_ERR(e))
 { ...
*  PTR_ERR(e1)
   ... }
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/crystalhd/crystalhd_lnx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/cr=
ystalhd/crystalhd_lnx.c
index 5909d8d..166203a 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -381,7 +381,7 @@ static int __devinit chd_dec_init_chdev(struct crystalh=
d_adp *adp)
 	dev =3D device_create(crystalhd_class, NULL, MKDEV(adp->chd_dec_major, 0),
 			    NULL, "crystalhd");
 	if (IS_ERR(dev)) {
-		rc =3D PTR_ERR(crystalhd_class);
+		rc =3D PTR_ERR(dev);
 		BCMLOG_ERR("failed to create device\n");
 		goto device_create_fail;
 	}

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
