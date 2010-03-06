From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:09:44 +0000
Subject: [patch] joystick: off by one error
Message-Id: <20100306110944.GG4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Scott Moreau <oreaus@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This fixes a smatch warning:
drivers/input/joystick/gamecon.c +838 gc_setup_pad(23) error: buffer overflow 'gc_names' 10 <= 10

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/input/joystick/gamecon.c b/drivers/input/joystick/gamecon.c
index ae998d9..7a55714 100644
--- a/drivers/input/joystick/gamecon.c
+++ b/drivers/input/joystick/gamecon.c
@@ -819,7 +819,7 @@ static int __init gc_setup_pad(struct gc *gc, int idx, int pad_type)
 	int i;
 	int err;
 
-	if (pad_type < 1 || pad_type > GC_MAX) {
+	if (pad_type < 1 || pad_type >= GC_MAX) {
 		pr_err("Pad type %d unknown\n", pad_type);
 		return -EINVAL;
 	}
