From: Bivolaru Catalin <bivolaru.catalin@gmail.com>
Date: Sun, 20 Jul 2014 12:01:03 +0000
Subject: [PATCH] staging: input: sunkbd.c: Fix coding style
Message-Id: <20140720120103.GA5294@kalio-PC>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: paul.gortmaker@windriver.com

Fix coding style with regard to missing spaces after , and the column limit
that was violated after the first change.

Signed-off-by: Bivolaru Catalin <bivolaru.catalin@gmail.com>
---

The change was tested only by compilation.

diff --git a/drivers/input/keyboard/sunkbd.c b/drivers/input/keyboard/sunkbd.c
index dc6bb9d..25ba6b6 100644
--- a/drivers/input/keyboard/sunkbd.c
+++ b/drivers/input/keyboard/sunkbd.c
@@ -42,14 +42,15 @@ MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 
 static unsigned char sunkbd_keycode[128] = {
-	  0,128,114,129,115, 59, 60, 68, 61, 87, 62, 88, 63,100, 64,112,
-	 65, 66, 67, 56,103,119, 99, 70,105,130,131,108,106,  1,  2,  3,
-	  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 41, 14,110,113, 98, 55,
-	116,132, 83,133,102, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
-	 26, 27,111,127, 71, 72, 73, 74,134,135,107,  0, 29, 30, 31, 32,
-	 33, 34, 35, 36, 37, 38, 39, 40, 43, 28, 96, 75, 76, 77, 82,136,
-	104,137, 69, 42, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54,101,
-	 79, 80, 81,  0,  0,  0,138, 58,125, 57,126,109, 86, 78
+	  0, 128, 114, 129, 115,  59,  60,  68,  61,  87,  62,  88,  63, 100,
+	 64, 112,  65,  66,  67,  56, 103, 119,  99,  70, 105, 130, 131, 108,
+	106,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,
+	 41,  14, 110, 113,  98,  55, 116, 132,  83, 133, 102,  15,  16,  17,
+	 18,  19,  20,  21,  22,  23,  24,  25,  26,  27, 111, 127,  71,  72,
+	 73,  74, 134, 135, 107,   0,  29,  30,  31,  32,  33,  34,  35,  36,
+	 37,  38,  39,  40,  43,  28,  96,  75,  76,  77,  82, 136, 104, 137,
+	 69,  42,  44,  45,  46,  47,  48,  49,  50,  51,  52,  53,  54, 101,
+	 79,  80,  81,   0,   0,   0, 138,  58, 125,  57, 126, 109,  86,  78
 };
 
 #define SUNKBD_CMD_RESET	0x1
