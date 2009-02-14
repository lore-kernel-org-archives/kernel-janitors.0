From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:12:36 +0000
Subject: [PATCH 04/43] drivers/net/ns83820.c: fix sparse warnings: fix
Message-Id: <20090214211231.23489.52423.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)
  drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)
  drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)
  drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/ns83820.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ns83820.c b/drivers/net/ns83820.c
index e80294d..9266502 100644
--- a/drivers/net/ns83820.c
+++ b/drivers/net/ns83820.c
@@ -409,7 +409,7 @@ static int lnksts = 0;		/* CFG_LNKSTS bit polarity */
 struct rx_info {
 	spinlock_t	lock;
 	int		up;
-	long		idle;
+	unsigned long	idle;
 
 	struct sk_buff	*skbs[NR_RX_DESC];
 

