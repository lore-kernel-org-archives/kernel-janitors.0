From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 12:15:24 +0000
Subject: [PATCH 3/3] drivers/crypto/omap-{des,aes}.c: fix sanity checks
Message-Id: <1405599324-11215-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Cc: dcb314@hotmail.com, davem@davemloft.net, herbert@gondor.apana.org.au, Andrey Utkin <andrey.krieger.utkin@gmail.com>

Unsigned variable "total" was tested for negativity after subtraction
operation. 2 instances.
Replaced that with the test of minuend being greater than subtrahend
before the subtraction.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80421
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/crypto/omap-aes.c | 4 ++--
 drivers/crypto/omap-des.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index cb98fa5..413ed78 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -1038,10 +1038,10 @@ static irqreturn_t omap_aes_irq(int irq, void *dev_=
id)
 			}
 		}
=20
+		BUG_ON(dd->total < AES_BLOCK_SIZE);
+
 		dd->total -=3D AES_BLOCK_SIZE;
=20
-		BUG_ON(dd->total < 0);
-
 		/* Clear IRQ status */
 		status &=3D ~AES_REG_IRQ_DATA_OUT;
 		omap_aes_write(dd, AES_REG_IRQ_STATUS(dd), status);
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index b8bc84b..93aa213 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -965,10 +965,10 @@ static irqreturn_t omap_des_irq(int irq, void *dev_id)
 			}
 		}
=20
+		BUG_ON(dd->total < DES_BLOCK_SIZE);
+
 		dd->total -=3D DES_BLOCK_SIZE;
=20
-		BUG_ON(dd->total < 0);
-
 		/* Clear IRQ status */
 		status &=3D ~DES_REG_IRQ_DATA_OUT;
 		omap_des_write(dd, DES_REG_IRQ_STATUS(dd), status);
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
