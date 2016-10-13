From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 16:24:46 +0000
Subject: [PATCH 04/18] [media] RedRat3: One function call less in redrat3_transmit_ir() after error detection
Message-Id: <7878868c-bc54-5577-b808-ed096bbf3759@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
In-Reply-To: <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 10:50:24 +0200

The kfree() function was called in one case by the
redrat3_transmit_ir() function during error handling
even if the passed variable contained a null pointer.

* Adjust jump targets according to the Linux coding style convention.

* Move the resetting for the data structure member "transmitting"
  at the end.

* Delete initialisations for the variables "irdata" and "sample_lens"
  at the beginning which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/rc/redrat3.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 7ae2ced..71e901d 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -723,10 +723,10 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 {
 	struct redrat3_dev *rr3 = rcdev->priv;
 	struct device *dev = rr3->dev;
-	struct redrat3_irdata *irdata = NULL;
+	struct redrat3_irdata *irdata;
 	int ret, ret_len;
 	int lencheck, cur_sample_len, pipe;
-	int *sample_lens = NULL;
+	int *sample_lens;
 	u8 curlencheck;
 	unsigned i, sendbuf_len;
 
@@ -747,7 +747,7 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 	irdata = kzalloc(sizeof(*irdata), GFP_KERNEL);
 	if (!irdata) {
 		ret = -ENOMEM;
-		goto out;
+		goto free_sample;
 	}
 
 	/* rr3 will disable rc detector on transmit */
@@ -776,7 +776,7 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 				curlencheck++;
 			} else {
 				ret = -EINVAL;
-				goto out;
+				goto reset_member;
 			}
 		}
 		irdata->sigdata[i] = lencheck;
@@ -811,14 +811,12 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 		dev_err(dev, "Error: control msg send failed, rc %d\n", ret);
 	else
 		ret = count;
-
-out:
-	kfree(irdata);
-	kfree(sample_lens);
-
+reset_member:
 	rr3->transmitting = false;
 	/* rr3 re-enables rc detector because it was enabled before */
-
+	kfree(irdata);
+free_sample:
+	kfree(sample_lens);
 	return ret;
 }
 
-- 
2.10.1

