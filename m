From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 15:00:03 +0000
Subject: [PATCH 2/2] Input: turbografx: Improve a size determination in tgfx_attach()
Message-Id: <14ac4f8d-90bd-0ad7-eee8-fbb47c2cba5c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dfa75f58-43e5-dc80-a606-2914b980f6e7@users.sourceforge.net>
In-Reply-To: <dfa75f58-43e5-dc80-a606-2914b980f6e7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Geliang Tang <geliangtang@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 15:46:24 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/joystick/turbografx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/turbografx.c b/drivers/input/joystick/turbografx.c
index 454d4c032292..472bc438927e 100644
--- a/drivers/input/joystick/turbografx.c
+++ b/drivers/input/joystick/turbografx.c
@@ -191,7 +191,7 @@ static void tgfx_attach(struct parport *pp)
 		return;
 	}
 
-	tgfx = kzalloc(sizeof(struct tgfx), GFP_KERNEL);
+	tgfx = kzalloc(sizeof(*tgfx), GFP_KERNEL);
 	if (!tgfx)
 		goto err_unreg_pardev;
 
-- 
2.16.1

