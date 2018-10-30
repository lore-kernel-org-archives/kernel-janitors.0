From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 11:29:42 +0000
Subject: [PATCH] mtip32xx: clean an indentation issue, remove extraneous tabs
Message-Id: <20181030112942.10186-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <jthumshirn@suse.de>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, remove tabs

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index dfc8de6ce525..a7daa8acbab3 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -1942,8 +1942,8 @@ static int exec_drive_taskfile(struct driver_data *dd,
 				dev_warn(&dd->pdev->dev,
 					"data movement but "
 					"sect_count is 0\n");
-					err = -EINVAL;
-					goto abort;
+				err = -EINVAL;
+				goto abort;
 			}
 		}
 	}
-- 
2.19.1
