From: Mathias Krause <minipli@googlemail.com>
Date: Sat, 30 Jul 2011 12:01:59 +0000
Subject: [PATCH] tty: clearify structure initializer in notify_write()
Message-Id: <1312027319-1402-1-git-send-email-minipli@googlemail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

Even though this is valid C we should not mix C99 initializers with
obfuscated ANSI C. Stick to C99 and initialize c by its name.

Found by clang:
drivers/tty/vt/vt.c:262:55: warning: explicitly assigning a variable of
type 'unsigned int' to itself [-Wself-assign]
    struct vt_notifier_param param = { .vc = vc, unicode = unicode };
                                                 ~~~~~~~ ^ ~~~~~~~

Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 drivers/tty/vt/vt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index b3915b7..e716839 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -259,7 +259,7 @@ EXPORT_SYMBOL_GPL(unregister_vt_notifier);
 
 static void notify_write(struct vc_data *vc, unsigned int unicode)
 {
-	struct vt_notifier_param param = { .vc = vc, unicode = unicode };
+	struct vt_notifier_param param = { .vc = vc, .c = unicode };
 	atomic_notifier_call_chain(&vt_notifier_list, VT_WRITE, &param);
 }
 
-- 
1.5.6.5

