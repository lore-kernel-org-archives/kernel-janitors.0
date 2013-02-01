From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Feb 2013 13:28:27 +0000
Subject: [patch] sony-laptop: leak in error handling sony_nc_lid_resume_setup()
Message-Id: <20130201132826.GA23374@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to decrement "i" first because the current "i" was not allocated
succesfully.  Also we should go free the way down to zero to avoid a
leak.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 438c7fa..9557414 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2351,7 +2351,7 @@ static int sony_nc_lid_resume_setup(struct platform_device *pd)
 	return 0;
 
 liderror:
-	for (; i > 0; i--)
+	for (i--; i >= 0; i--)
 		device_remove_file(&pd->dev, &lid_ctl->attrs[i]);
 
 	kfree(lid_ctl);
