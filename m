From: Manish Katiyar <mkatiyar@gmail.com>
Date: Sun, 22 Feb 2009 04:54:32 +0000
Subject: [PATCH] kernel/power/poweroff.c : Fix coding style whitespace fixes
Message-Id: <ea11fea30902212054vbf5c74ub6545f69a9ad92c3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix coding style whitespace fixes. Patch compile tested
Before :-
total: 1 errors, 0 warnings, 46 lines checked
After
total: 0 errors, 0 warnings, 46 lines checked

Before :-
  text	   data	    bss	    dec	    hex	filename
    107	     48	      0	    155	     9b	kernel/power/poweroff.o
After
   text	   data	    bss	    dec	    hex	filename
    107	     48	      0	    155	     9b	kernel/power/poweroff.o


Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 kernel/power/poweroff.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/power/poweroff.c b/kernel/power/poweroff.c
index 9789083..e8b3370 100644
--- a/kernel/power/poweroff.c
+++ b/kernel/power/poweroff.c
@@ -34,7 +34,7 @@ static struct sysrq_key_op	sysrq_poweroff_op = {
 	.handler        = handle_poweroff,
 	.help_msg       = "powerOff",
 	.action_msg     = "Power Off",
- 	.enable_mask	= SYSRQ_ENABLE_BOOT,
+	.enable_mask	= SYSRQ_ENABLE_BOOT,
 };

 static int pm_sysrq_init(void)
-- 
1.5.4.3


Thanks -
Manish
