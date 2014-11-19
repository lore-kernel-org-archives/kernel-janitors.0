From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Nov 2014 13:50:44 +0000
Subject: [PATCH 1/1] char: tpm: Deletion of unnecessary checks before the function call "tpm_dev_vendor_relea
Message-Id: <546CA034.60705@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashley Lai <ashley@ashleylai.com>, Marcel Selhorst <tpmdd@selhorst.net>, Peter Huewe <peterhuewe@gmx.de>, tpmdd-devel@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Nov 2014 14:44:15 +0100

The tpm_dev_vendor_release() function tests whether its argument is NULL
and then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/tpm/tpm_i2c_atmel.c   | 3 +--
 drivers/char/tpm/tpm_i2c_nuvoton.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
index 7727292..19c3a7b 100644
--- a/drivers/char/tpm/tpm_i2c_atmel.c
+++ b/drivers/char/tpm/tpm_i2c_atmel.c
@@ -202,8 +202,7 @@ static int i2c_atmel_remove(struct i2c_client *client)
 	struct device *dev = &(client->dev);
 	struct tpm_chip *chip = dev_get_drvdata(dev);
 
-	if (chip)
-		tpm_dev_vendor_release(chip);
+	tpm_dev_vendor_release(chip);
 	tpm_remove_hardware(dev);
 	kfree(chip);
 	return 0;
diff --git a/drivers/char/tpm/tpm_i2c_nuvoton.c b/drivers/char/tpm/tpm_i2c_nuvoton.c
index 7b158ef..8d09628 100644
--- a/drivers/char/tpm/tpm_i2c_nuvoton.c
+++ b/drivers/char/tpm/tpm_i2c_nuvoton.c
@@ -625,8 +625,7 @@ static int i2c_nuvoton_remove(struct i2c_client *client)
 	struct device *dev = &(client->dev);
 	struct tpm_chip *chip = dev_get_drvdata(dev);
 
-	if (chip)
-		tpm_dev_vendor_release(chip);
+	tpm_dev_vendor_release(chip);
 	tpm_remove_hardware(dev);
 	kfree(chip);
 	return 0;
-- 
2.1.3

