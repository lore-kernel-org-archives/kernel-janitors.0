From: Colin King <colin.king@canonical.com>
Date: Sat, 13 Oct 2018 15:37:30 +0000
Subject: [PATCH] rsi: fix spelling mistake "Initialzing" -> "Initializing"
Message-Id: <20181013153730.5761-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in rsi_dbg debug message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/rsi/rsi_91x_sdio_ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c b/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c
index 612c211e21a1..449f6d23c5e3 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c
@@ -210,7 +210,7 @@ int rsi_init_sdio_slave_regs(struct rsi_hw *adapter)
 	}
 
 	/* This tells SDIO FIFO when to start read to host */
-	rsi_dbg(INIT_ZONE, "%s: Initialzing SDIO read start level\n", __func__);
+	rsi_dbg(INIT_ZONE, "%s: Initializing SDIO read start level\n", __func__);
 	byte = 0x24;
 
 	status = rsi_sdio_write_register(adapter,
@@ -223,7 +223,7 @@ int rsi_init_sdio_slave_regs(struct rsi_hw *adapter)
 		return -1;
 	}
 
-	rsi_dbg(INIT_ZONE, "%s: Initialzing FIFO ctrl registers\n", __func__);
+	rsi_dbg(INIT_ZONE, "%s: Initializing FIFO ctrl registers\n", __func__);
 	byte = (128 - 32);
 
 	status = rsi_sdio_write_register(adapter,
-- 
2.17.1
