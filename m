From: Aaron Cripps <acripps@gmail.com>
Date: Tue, 05 Jun 2007 22:52:56 +0000
Subject: [KJ] Re: [PATCH ARRAY_SIZE 1/4] kernel 2.6 size macro clean ups in
Message-Id: <4665EC18.7010309@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <465C99C3.4030802@gmail.com>
In-Reply-To: <465C99C3.4030802@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

this is a simple patch to remove the MAX_SPEEDS macro in favor of the more
generic ARRAY_SIZE(arr) macro defined in kernel.h

Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>


diff --git a/drivers/net/irda/actisys-sir.c b/drivers/net/irda/actisys-sir.c
index 9715ab5..44bf0c2 100644
--- a/drivers/net/irda/actisys-sir.c
+++ b/drivers/net/irda/actisys-sir.c
@@ -67,8 +67,6 @@ static int actisys_reset(struct sir_dev *);
 /* Note : the 220L doesn't support 38400, but we will fix that below */
 static unsigned baud_rates[] = { 9600, 19200, 57600, 115200, 38400 };
 
-#define MAX_SPEEDS (sizeof(baud_rates)/sizeof(baud_rates[0]))
-
 static struct dongle_driver act220l = {
     .owner        = THIS_MODULE,
     .driver_name    = "Actisys ACT-220L",
@@ -176,7 +174,7 @@ static int actisys_change_speed(struct sir_dev *dev, 
unsigned speed)
      * Now, we can set the speed requested. Send RTS pulses until we
          * reach the target speed
      */
-    for (i = 0; i < MAX_SPEEDS; i++) {
+    for (i = 0; i < ARRAY_SIZE(baud_rates); i++) {
         if (speed = baud_rates[i]) {
             dev->speed = speed;
             break;
@@ -191,7 +189,7 @@ static int actisys_change_speed(struct sir_dev *dev, 
unsigned speed)
     }
 
     /* Check if life is sweet... */
-    if (i >= MAX_SPEEDS) {
+    if (i >= ARRAY_SIZE(baud_rates)) {
         actisys_reset(dev);
         ret = -EINVAL;  /* This should not happen */
     }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
