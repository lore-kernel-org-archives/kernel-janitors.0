From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jun 2020 15:21:51 +0000
Subject: [PATCH][V2] input: ims-pcu: return error code rather than -ENOMEM
Message-Id: <20200603152151.139337-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the assignment of -ENOMEM to error is redudant because error
is not being read and -ENOMEM is being hard coded as an error return.
Fix this by returning the error code in variable 'error'; this also
allows the error code from a failed call to input_register_device to
be preserved and returned to the caller rather than just returning
a possibly inappropriate -ENOMEM.

Kudos to Dan Carpenter for the suggestion of an improved fix.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>

---

V2: change subject line and return the error code rather than
    removing the ENOMEM assignment to error. Thanks to Dan Carpenter
    for explaining a better fix.

---
 drivers/input/misc/ims-pcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index d8dbfc030d0f..08b9b5cdb943 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -335,7 +335,7 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
 err_free_mem:
 	input_free_device(input);
 	kfree(gamepad);
-	return -ENOMEM;
+	return error;
 }
 
 static void ims_pcu_destroy_gamepad(struct ims_pcu *pcu)
-- 
2.25.1
