From: Dan Carpenter <error27@gmail.com>
Date: Fri, 18 Feb 2011 09:17:57 +0000
Subject: [patch] Input: uinput - reversed test in uinput_setup_device()
Message-Id: <20110218091757.GB4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@euromail.se>, Daniel Mack <daniel@caiaq.de>, Ping Cheng <pingc@wacom.com>, Aristeu Rozanski <aris@ruivo.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

The test here is reversed. It should be if (IS_ERR()) instead of
if (!IS_ERR()).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 7f8331f..364bdf4 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -362,7 +362,7 @@ static int uinput_setup_device(struct uinput_device *udev, const char __user *bu
 	dev = udev->dev;
 
 	user_dev = memdup_user(buffer, sizeof(struct uinput_user_dev));
-	if (!IS_ERR(user_dev))
+	if (IS_ERR(user_dev))
 		return PTR_ERR(user_dev);
 
 	udev->ff_effects_max = user_dev->ff_effects_max;
