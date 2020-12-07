From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Dec 2020 16:12:31 +0000
Subject: [PATCH] net: sched: fix spelling mistake in Kconfig "trys" -> "tries"
Message-Id: <20201207161231.173234-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/nfc/Kconfig   | 2 +-
 net/sched/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/Kconfig b/net/nfc/Kconfig
index 9b27599870e3..96b91674dd37 100644
--- a/net/nfc/Kconfig
+++ b/net/nfc/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# NFC sybsystem configuration
+# NFC subsystem configuration
 #
 
 menuconfig NFC
diff --git a/net/sched/Kconfig b/net/sched/Kconfig
index a3b37d88800e..8a4542387bbd 100644
--- a/net/sched/Kconfig
+++ b/net/sched/Kconfig
@@ -281,7 +281,7 @@ config NET_SCH_CHOKE
 	help
 	  Say Y here if you want to use the CHOKe packet scheduler (CHOose
 	  and Keep for responsive flows, CHOose and Kill for unresponsive
-	  flows). This is a variation of RED which trys to penalize flows
+	  flows). This is a variation of RED which tries to penalize flows
 	  that monopolize the queue.
 
 	  To compile this code as a module, choose M here: the
-- 
2.29.2
