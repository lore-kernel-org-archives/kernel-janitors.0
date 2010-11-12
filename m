From: Dan Carpenter <error27@gmail.com>
Date: Fri, 12 Nov 2010 05:08:35 +0000
Subject: [patch] Staging: speakup: free after input_unregister_device()
Message-Id: <20101112050835.GE3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

input_unregister_device() frees the device so the call to
input_free_device() is a double free.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/speakup/fakekey.c b/drivers/staging/speakup/fakekey.c
index adb93f2..65b2311 100644
--- a/drivers/staging/speakup/fakekey.c
+++ b/drivers/staging/speakup/fakekey.c
@@ -62,7 +62,6 @@ void speakup_remove_virtual_keyboard(void)
 {
 	if (virt_keyboard != NULL) {
 		input_unregister_device(virt_keyboard);
-		input_free_device(virt_keyboard);
 		virt_keyboard = NULL;
 	}
 }
