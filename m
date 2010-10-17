From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:51:57 +0000
Subject: [PATCH] staging: speakup: fix memory leak
Message-Id: <1287327118-9244-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, William Hubbs <w.d.hubbs@gmail.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

speakup_init() didn't free first_console if speakup_kobj_init() fails.
Also propagate speakup_kobj_init()'s return code.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/staging/speakup/main.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/speakup/main.c b/drivers/staging/speakup/main.c
index 2ef3b39..b02a61f 100644
--- a/drivers/staging/speakup/main.c
+++ b/drivers/staging/speakup/main.c
@@ -2255,8 +2255,11 @@ static int __init speakup_init(void)
 	first_console = kzalloc(sizeof(*first_console), GFP_KERNEL);
 	if (!first_console)
 		return -ENOMEM;
-	if (speakup_kobj_init() < 0) 
-		return -ENOMEM;
+	err = speakup_kobj_init();
+	if (err) {
+		kfree(first_console);
+		return err;
+	}
 
 	reset_default_chars();
 	reset_default_chartab();
-- 
1.7.0.4

