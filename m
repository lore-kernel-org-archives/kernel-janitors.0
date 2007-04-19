From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Thu, 19 Apr 2007 11:31:02 +0000
Subject: [KJ][PATCH]SPIN_LOCK_UNLOCKED cleanup in drivers/char/keyboard
Message-Id: <20070419111902.GB11493@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070419041440.GB14283@arun.site>
In-Reply-To: <20070419041440.GB14283@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@lists.osdl.org>, INPUT <linux-input@atrey.karlin.mff.cuni.cz>
Cc: Andrw Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com

SPIN_LOCK_UNLOCKED cleanup,use __SPIN_LOCK_UNLOCKED instead 

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 keyboard.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/keyboard.c b/drivers/char/keyboard.c
index cb8d691..df9bfc1 100644
--- a/drivers/char/keyboard.c
+++ b/drivers/char/keyboard.c
@@ -110,7 +110,7 @@ struct kbd_struct kbd_table[MAX_NR_CONSOLES];
 static struct kbd_struct *kbd = kbd_table;
 
 struct vt_spawn_console vt_spawn_con = {
-	.lock = SPIN_LOCK_UNLOCKED,
+	.lock = __SPIN_LOCK_UNLOCKED(vt_spawn_con.lock),
 	.pid  = NULL,
 	.sig  = 0,
 };
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
