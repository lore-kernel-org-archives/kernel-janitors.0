From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:14:48 +0000
Subject: [patch] arm: nwfpe: remove duplicate REG_R9 define
Message-Id: <20140609151448.GI9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The REG_R9 define is cut and pasted twice, so we can remove the second
define.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/arm/nwfpe/fpmodule.h b/arch/arm/nwfpe/fpmodule.h
index 5c2e8e4..acf4779 100644
--- a/arch/arm/nwfpe/fpmodule.h
+++ b/arch/arm/nwfpe/fpmodule.h
@@ -33,7 +33,6 @@
 #define REG_FP		11
 #define REG_R10		10
 #define REG_R9		9
-#define REG_R9		9
 #define REG_R8		8
 #define REG_R7		7
 #define REG_R6		6
