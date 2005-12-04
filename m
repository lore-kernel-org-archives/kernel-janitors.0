From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:17:52 +0000
Subject: [KJ] [PATCH 9/21] polling loops: change exit condition to
Message-Id: <439235B0.4060100@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

INPUT (KEYBOARD, MOUSE, JOYSTICK) DRIVERS
P:	Vojtech Pavlik
M:	vojtech@suse.cz

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/input/joystick/analog.c linux-2.6.15-rc4/drivers/input/joystick/analog.c
--- linux-2.6.15-rc4-orig/drivers/input/joystick/analog.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/input/joystick/analog.c	2005-12-03 16:53:10.000000000 +0100
@@ -576,6 +576,7 @@ static int analog_init_masks(struct anal
 static int analog_init_port(struct gameport *gameport, struct gameport_driver *drv, struct analog_port *port)
 {
 	int i, t, u, v;
+	unsigned long end_time;
 
 	port->gameport = gameport;
 
@@ -591,7 +592,8 @@ static int analog_init_port(struct gamep
 		port->mask = (gameport_read(gameport) ^ t) & t & 0xf;
 		port->fuzz = (port->speed * ANALOG_FUZZ_MAGIC) / port->loop / 1000 + ANALOG_FUZZ_BITS;
 
-		for (i = 0; i < ANALOG_INIT_RETRIES; i++) {
+		end_time = jiffies + msecs_to_jiffies(ANALOG_MAX_TIME * ANALOG_INIT_RETRIES);
+		while (time_before(jiffies, end_time)) {
 			if (!analog_cooked_read(port))
 				break;
 			msleep(ANALOG_MAX_TIME);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
