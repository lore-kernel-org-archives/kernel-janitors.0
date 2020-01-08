From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 08 Jan 2020 01:54:31 +0000
Subject: [PATCH -next] Bluetooth: hci_qca: Remove set but not used variable 'opcode'
Message-Id: <20200108015431.51996-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/bluetooth/hci_qca.c: In function 'qca_controller_memdump':
drivers/bluetooth/hci_qca.c:980:6: warning:
 variable 'opcode' set but not used [-Wunused-but-set-variable]

It is never used since commit d841502c79e3 ("Bluetooth: hci_qca: Collect
controller memory dump during SSR"), so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/bluetooth/hci_qca.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9392cc7f9908..c9a0c55ef832 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -977,7 +977,7 @@ static void qca_controller_memdump(struct work_struct *work)
 	struct qca_dump_size *dump;
 	char *memdump_buf;
 	char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
-	u16 opcode, seq_no;
+	u16 seq_no;
 	u32 dump_size;
 
 	while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
@@ -993,7 +993,6 @@ static void qca_controller_memdump(struct work_struct *work)
 
 		qca->memdump_state = QCA_MEMDUMP_COLLECTING;
 		cmd_hdr = (void *) skb->data;
-		opcode = __le16_to_cpu(cmd_hdr->opcode);
 		seq_no = __le16_to_cpu(cmd_hdr->seq_no);
 		skb_pull(skb, sizeof(struct qca_memdump_event_hdr));
