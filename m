From: Andi Drebes <lists-receive@programmierforen.de>
Date: Wed, 06 Jun 2007 20:10:10 +0000
Subject: [KJ] [PATCH] [trivial] drivers/input/joystick/grip_mp.c: ARRAY_SIZE
Message-Id: <200706062210.11555.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.torokhov@gmail.com, linux-joystick@atrey.karlin.mff.cuni.cz, linux-input@atrey.karlin.mff.cuni.cz, kernel-janitors@lists.osdl.org

This patch replaces an array size calculation in drivers/input/joystick/grip_mp.c
that was done using sizeof with the ARRAY_SIZE macro. To be more specific,
I replaced a variable called seq_len in the function dig_mode_start that stored
the size of the array with ARRAY_SIZE. The variable was referenced only once,
so I think removing it is ok.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 555319e..4ed3a3e 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -320,10 +320,10 @@ static int multiport_io(struct gameport* gameport, int sendflags, int sendcode,
 
 static int dig_mode_start(struct gameport *gameport, u32 *packet)
 {
-	int i, seq_len = sizeof(init_seq)/sizeof(int);
+	int i;
 	int flags, tries = 0, bads = 0;
 
-	for (i = 0; i < seq_len; i++) {     /* Send magic sequence */
+	for (i = 0; i < ARRAY_SIZE(init_seq); i++) {     /* Send magic sequence */
 		if (init_seq[i])
 			gameport_trigger(gameport);
 		udelay(GRIP_INIT_DELAY);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
