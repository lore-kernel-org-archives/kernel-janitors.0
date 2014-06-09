From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:09:52 +0000
Subject: [patch] regulator: 88pm800: remove duplicate PM800_BUCK3 define
Message-Id: <20140609150951.GD9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The PM800_BUCK3 define is cut and pasted twice so we can remove the
second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/88pm800.c b/drivers/regulator/88pm800.c
index 7a721d67..4e6c8c6 100644
--- a/drivers/regulator/88pm800.c
+++ b/drivers/regulator/88pm800.c
@@ -52,7 +52,6 @@
 #define PM800_BUCK1_3		(0x3F)
 #define PM800_BUCK2		(0x40)
 #define PM800_BUCK3		(0x41)
-#define PM800_BUCK3		(0x41)
 #define PM800_BUCK4		(0x42)
 #define PM800_BUCK4_1		(0x43)
 #define PM800_BUCK4_2		(0x44)
