From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 04 Dec 2019 07:18:22 +0000
Subject: [PATCH v2 -next] NFC: port100: Convert cpu_to_le16(le16_to_cpu(E1) + E2) to use le16_add_cpu().
Message-Id: <20191204071822.116115-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204063717.102854-1-maowenan@huawei.com>
In-Reply-To: <20191204063717.102854-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, gregkh@linuxfoundation.org, alexios.zavras@intel.com, oneukum@suse.com, tglx@linutronix.de, julia.lawall@inria.fr
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>, Hulk Robot <hulkci@huawei.com>

Convert cpu_to_le16(le16_to_cpu(frame->datalen) + len) to
use le16_add_cpu(), which is more concise and does the same thing. 

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: change log as julia suggest.
 drivers/nfc/port100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 604dba4..8e4d355 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -565,7 +565,7 @@ static void port100_tx_update_payload_len(void *_frame, int len)
 {
 	struct port100_frame *frame = _frame;
 
-	frame->datalen = cpu_to_le16(le16_to_cpu(frame->datalen) + len);
+	le16_add_cpu(&frame->datalen, len);
 }
 
 static bool port100_rx_frame_is_valid(void *_frame)
-- 
2.7.4
