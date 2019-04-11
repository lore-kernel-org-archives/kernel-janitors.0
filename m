From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 11 Apr 2019 02:59:04 +0000
Subject: [PATCH -next] memstick: remove set but not used variable 'data'
Message-Id: <20190411025904.188152-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will.deacon@arm.com>, ulf.hansson@linaro.org, axboe@kernel.dk, osandov@fb.com, hare@suse.de
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/memstick/host/jmb38x_ms.c: In function 'jmb38x_ms_issue_cmd':
drivers/memstick/host/jmb38x_ms.c:371:17: warning:
 variable 'data' set but not used [-Wunused-but-set-variable]

It's never used since introduction and can be removed.
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/memstick/host/jmb38x_ms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
index e3a5af65dbce..acec09813419 100644
--- a/drivers/memstick/host/jmb38x_ms.c
+++ b/drivers/memstick/host/jmb38x_ms.c
@@ -368,7 +368,6 @@ static int jmb38x_ms_transfer_data(struct jmb38x_ms_host *host)
 static int jmb38x_ms_issue_cmd(struct memstick_host *msh)
 {
 	struct jmb38x_ms_host *host = memstick_priv(msh);
-	unsigned char *data;
 	unsigned int data_len, cmd, t_val;
 
 	if (!(STATUS_HAS_MEDIA & readl(host->addr + STATUS))) {
@@ -400,8 +399,6 @@ static int jmb38x_ms_issue_cmd(struct memstick_host *msh)
 			cmd |= TPC_WAIT_INT;
 	}
 
-	data = host->req->data;
-
 	if (!no_dma)
 		host->cmd_flags |= DMA_DATA;
