From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Sep 2019 15:35:00 +0000
Subject: [PATCH] s390/qeth: fix spelling mistake "alocpool" -> "allocpool"
Message-Id: <20190911153500.30836-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Wiedmann <jwi@linux.ibm.com>, Ursula Braun <ubraun@linux.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, linux-s390@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in QETH_CARD_TEXT text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/s390/net/qeth_core_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
index a7868c8133ee..ab96b22db3fe 100644
--- a/drivers/s390/net/qeth_core_main.c
+++ b/drivers/s390/net/qeth_core_main.c
@@ -218,7 +218,7 @@ static int qeth_alloc_buffer_pool(struct qeth_card *card)
 	void *ptr;
 	int i, j;
 
-	QETH_CARD_TEXT(card, 5, "alocpool");
+	QETH_CARD_TEXT(card, 5, "allocpool");
 	for (i = 0; i < card->qdio.init_pool.buf_count; ++i) {
 		pool_entry = kzalloc(sizeof(*pool_entry), GFP_KERNEL);
 		if (!pool_entry) {
-- 
2.20.1
