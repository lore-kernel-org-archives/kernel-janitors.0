From: Dan Carpenter <error27@gmail.com>
Date: Sat, 20 Mar 2010 11:18:43 +0000
Subject: [patch] backlight: backlight_device_register() return ERR_PTR()
Message-Id: <20100320111843.GS5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, Matthew Garrett <mjg@redhat.com>, Thierry Reding <thierry.reding@avionic-design.de>, Emese Revfy <re.emese@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

backlight_device_register() returns a valid pointer or ERR_PTR() 
never NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/video/backlight/adx_bl.c b/drivers/video/backlight/adx_bl.c
index b0624b9..c02b851 100644
--- a/drivers/video/backlight/adx_bl.c
+++ b/drivers/video/backlight/adx_bl.c
@@ -106,8 +106,8 @@ static int __devinit adx_backlight_probe(struct platform_device *pdev)
 	props.max_brightness = 0xff;
 	bldev = backlight_device_register(dev_name(&pdev->dev), &pdev->dev,
 					  bl, &adx_backlight_ops, &props);
-	if (!bldev) {
-		ret = -ENOMEM;
+	if (IS_ERR(bldev)) {
+		ret = PTR_ERR(bldev);
 		goto out;
 	}
 
