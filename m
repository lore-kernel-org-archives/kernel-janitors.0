From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:13:39 +0000
Subject: [PATCH 07/43] drivers/net/ni65.c: fix sparse warnings: fix signedness
Message-Id: <20090214211332.23489.25144.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/net/ni65.c:488:36: warning: incorrect type in argument 2 (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/ni65.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ni65.c b/drivers/net/ni65.c
index d769a88..df5f869 100644
--- a/drivers/net/ni65.c
+++ b/drivers/net/ni65.c
@@ -481,8 +481,9 @@ static int __init ni65_probe1(struct net_device *dev,int ioaddr)
 	else {
 		if(dev->dma = 0) {
 		/* 'stuck test' from lance.c */
-			long dma_channels = ((inb(DMA1_STAT_REG) >> 4) & 0x0f) |
-					    (inb(DMA2_STAT_REG) & 0xf0);
+			unsigned long dma_channels +				((inb(DMA1_STAT_REG) >> 4) & 0x0f)
+				| (inb(DMA2_STAT_REG) & 0xf0);
 			for(i=1;i<5;i++) {
 				int dma = dmatab[i];
 				if(test_bit(dma,&dma_channels) || request_dma(dma,"ni6510"))

