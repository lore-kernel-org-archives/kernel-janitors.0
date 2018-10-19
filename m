From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 11:52:36 +0000
Subject: [PATCH net-next] rocker: Drop pointless static qualifier
Message-Id: <1539950579-182423-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@resnulli.us>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'struct rocker_desc_info *desc_info'
variable static since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/rocker/rocker_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/rocker/rocker_main.c b/drivers/net/ethernet/rocker/rocker_main.c
index 8721c05..beb0662 100644
--- a/drivers/net/ethernet/rocker/rocker_main.c
+++ b/drivers/net/ethernet/rocker/rocker_main.c
@@ -371,7 +371,7 @@ static void rocker_desc_cookie_ptr_set(const struct rocker_desc_info *desc_info,
 static struct rocker_desc_info *
 rocker_desc_head_get(const struct rocker_dma_ring_info *info)
 {
-	static struct rocker_desc_info *desc_info;
+	struct rocker_desc_info *desc_info;
 	u32 head = __pos_inc(info->head, info->size);
 
 	desc_info = &info->desc_info[info->head];
@@ -402,7 +402,7 @@ static void rocker_desc_head_set(const struct rocker *rocker,
 static struct rocker_desc_info *
 rocker_desc_tail_get(struct rocker_dma_ring_info *info)
 {
-	static struct rocker_desc_info *desc_info;
+	struct rocker_desc_info *desc_info;
 
 	if (info->tail = info->head)
 		return NULL; /* nothing to be done between head and tail */
