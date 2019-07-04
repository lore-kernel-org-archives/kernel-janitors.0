From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Jul 2019 13:30:31 +0000
Subject: [PATCH] staging: greybus: remove redundant assignment to variable is_empty
Message-Id: <20190704133031.28809-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable is_empty is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/greybus/audio_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index c2a4af4c1d06..9b19ea9d3fa1 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -86,7 +86,7 @@ EXPORT_SYMBOL_GPL(gb_audio_manager_remove);
 void gb_audio_manager_remove_all(void)
 {
 	struct gb_audio_manager_module *module, *next;
-	int is_empty = 1;
+	int is_empty;
 
 	down_write(&modules_rwsem);
 
-- 
2.20.1
