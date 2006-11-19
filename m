From: Paul Bonser <misterpib@gmail.com>
Date: Sun, 19 Nov 2006 10:01:35 +0000
Subject: [KJ] [PATCH] Input: kernel-doc typo, incorrect parameter name
Message-Id: <20061119100135.GA19397@pib>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Paul Bonser <misterpib@gmail.com>

A simple case of the wrong parameter name (handle when it should be  dev). It caused a warning when running kernel-doc on the file.
Just a kernel-doc comment fix.

Signed-off-by: Paul Bonser <misterpib@gmail.com>

---

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 1c8c8a5..d217d05 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -37,7 +37,7 @@ static struct input_handler *input_table
 
 /**
  * input_event() - report new input event
- * @handle: device that generated the event
+ * @dev: device that generated the event
  * @type: type of the event
  * @code: event code
  * @value: value of the event
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
