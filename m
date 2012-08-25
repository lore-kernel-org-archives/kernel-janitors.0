From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 25 Aug 2012 19:57:05 +0000
Subject: [PATCH 2/6] drivers/media/platform/mx2_emmaprp.c: adjust inconsistent IS_ERR and PTR_ERR
Message-Id: <1345924629-16584-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Change the call to IS_ERR to test the value that was just initialized and
is returned using PTR_ERR.

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
 drivers/media/platform/mx2_emmaprp.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/=
mx2_emmaprp.c
index dab380a..2be1bb1 100644
--- a/drivers/media/platform/mx2_emmaprp.c
+++ b/drivers/media/platform/mx2_emmaprp.c
@@ -908,9 +908,8 @@ static int emmaprp_probe(struct platform_device *pdev)
 	}
=20
 	pcdev->clk_emma_ahb =3D devm_clk_get(&pdev->dev, "ahb");
-	if (IS_ERR(pcdev->clk_emma_ipg)) {
+	if (IS_ERR(pcdev->clk_emma_ahb))
 		return PTR_ERR(pcdev->clk_emma_ahb);
-	}
=20
 	irq_emma =3D platform_get_irq(pdev, 0);
 	res_emma =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
