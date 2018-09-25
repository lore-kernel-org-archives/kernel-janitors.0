From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 25 Sep 2018 01:54:54 +0000
Subject: [PATCH -next] EDAC: i7core: Remove set but not used variable 'pvt'
Message-Id: <1537841043-108267-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/edac/i7core_edac.c: In function 'i7core_mce_check_error':
drivers/edac/i7core_edac.c:1818:21: warning:
 variable 'pvt' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/edac/i7core_edac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index bd65f57..943aab6 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -1815,14 +1815,12 @@ static int i7core_mce_check_error(struct notifier_block *nb, unsigned long val,
 	struct mce *mce = (struct mce *)data;
 	struct i7core_dev *i7_dev;
 	struct mem_ctl_info *mci;
-	struct i7core_pvt *pvt;
 
 	i7_dev = get_i7core_dev(mce->socketid);
 	if (!i7_dev)
 		return NOTIFY_DONE;
 
 	mci = i7_dev->mci;
-	pvt = mci->pvt_info;
 
 	/*
 	 * Just let mcelog handle it if the error is
