From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:44:21 +0000
Subject: [PATCH] drivers/isdn/hardware/mISDN: change type of hfc_jiffies to
Message-Id: <20090214224049.28194.38982.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@gmail.com>

Patch suggested by Jiri Slaby.

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---

This patch is based on:
    drivers/isdn/hardware/mISDN: fix sparse warnings: make symbols static

 drivers/isdn/hardware/mISDN/hfcpci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
index 2bb85c4..c7a855c 100644
--- a/drivers/isdn/hardware/mISDN/hfcpci.c
+++ b/drivers/isdn/hardware/mISDN/hfcpci.c
@@ -57,7 +57,7 @@ static int HFC_cnt;
 static uint debug;
 static uint poll, tics;
 static struct timer_list hfc_tl;
-static u32 hfc_jiffies;
+static ulong hfc_jiffies;
 
 MODULE_AUTHOR("Karsten Keil");
 MODULE_LICENSE("GPL");

