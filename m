From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 11 Apr 2010 15:29:02 +0000
Subject: [PATCH] usb/serial/generic: Fix compile error
Message-Id: <1270999742.11481.44.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

usb/serial/generic.c gives me a compile error when CONFIG_MAGIC_SYSRQ is
not defined.

The problem is that usb_serial_handle_sysrq_char() calls handle_sysrq()
that only is defined if CONFIG_MAGIC_SYSRQ is defined.

This patch add an empty handle_sysrq inline function if
CONFIG_MAGIC_SYSRQ is not defined and generic.c compiles cleanly.

From 9c484ab9136f25bf55b7664116a5f3b78eae69dc Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 11 Apr 2010 11:14:22 -0400
Subject: [PATCH] usb/serial/generic: Fix compile error


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 include/linux/sysrq.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 5f2bdef..0b754c1 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -53,6 +53,11 @@ int sysrq_toggle_support(int enable_mask);
 
 #else
 
+static inline void handle_sysrq(int key, struct tty_struct *tty)
+{
+
+}
+
 static inline int register_sysrq_key(int key, struct sysrq_key_op *op)
 {
 	return -EINVAL;
-- 
1.6.0.4










