From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jan 2012 06:33:15 +0000
Subject: [patch] leds: cleanup error handling in tca6507_probe()
Message-Id: <20120113063315.GB23737@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Purdie <rpurdie@rpsys.net>, NeilBrown <neilb@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Just a small tidy-up.

1) There is a NULL dereference if the tca allocation fails.
2) The call to cancel_work_sync() isn't needed because we haven't
   scheduled any work.
3) The call to i2c_set_clientdata() isn't needed because the core
   handles that automatically if probe() fails.
4) I added some curly braces for style reasons.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 133f89f..ec06a81 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -687,10 +687,9 @@ static int __devinit tca6507_probe(struct i2c_client *client,
 			NUM_LEDS);
 		return -ENODEV;
 	}
-	err = -ENOMEM;
 	tca = kzalloc(sizeof(*tca), GFP_KERNEL);
 	if (!tca)
-		goto exit;
+		return -ENOMEM;
 
 	tca->client = client;
 	INIT_WORK(&tca->work, tca6507_work);
@@ -724,11 +723,10 @@ static int __devinit tca6507_probe(struct i2c_client *client,
 
 	return 0;
 exit:
-	while (i--)
+	while (i--) {
 		if (tca->leds[i].led_cdev.name)
 			led_classdev_unregister(&tca->leds[i].led_cdev);
-	cancel_work_sync(&tca->work);
-	i2c_set_clientdata(client, NULL);
+	}
 	kfree(tca);
 	return err;
 }
