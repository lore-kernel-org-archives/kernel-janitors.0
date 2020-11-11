From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Wed, 11 Nov 2020 04:55:38 +0000
Subject: [PATCH][v2] Bluetooth: hci_qca: resolve various warnings
Message-Id: <20201111045538.GA90261@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marcel@holtmann.org
Cc: johan.hedberg@gmail.com, kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org

Replace symbolic permissions with octal values. Use usleep_range
for small msec values due to the fact that msleep() less than 
20ms may have unexpected behavior/sleep longer.

- https://lkml.org/lkml/2016/8/2/1945
- Documentation/timers/timers-howto.rst

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 2d3f1f179a1e..039fb117bd8f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -631,7 +631,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
 	ibs_dir = debugfs_create_dir("ibs", hdev->debugfs);
 
 	/* read only */
-	mode = S_IRUGO;
+	mode = 0444;
 	debugfs_create_u8("tx_ibs_state", mode, ibs_dir, &qca->tx_ibs_state);
 	debugfs_create_u8("rx_ibs_state", mode, ibs_dir, &qca->rx_ibs_state);
 	debugfs_create_u64("ibs_sent_sleeps", mode, ibs_dir,
@@ -658,7 +658,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
 	debugfs_create_u32("vote_off_ms", mode, ibs_dir, &qca->vote_off_ms);
 
 	/* read/write */
-	mode = S_IRUGO | S_IWUSR;
+	mode = 0644;
 	debugfs_create_u32("wake_retrans", mode, ibs_dir, &qca->wake_retrans);
 	debugfs_create_u32("tx_idle_delay", mode, ibs_dir,
 			   &qca->tx_idle_delay);
@@ -1302,7 +1302,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 
 	/* Give the controller time to process the request */
 	if (qca_is_wcn399x(qca_soc_type(hu)))
-		msleep(10);
+		usleep_range(1000, 10000);
 	else
 		msleep(300);
 
@@ -1350,7 +1350,7 @@ static int qca_send_power_pulse(struct hci_uart *hu, bool on)
 	if (on)
 		msleep(100);
 	else
-		msleep(10);
+		usleep_range(1000, 10000);
 
 	return 0;
 }
-- 
2.28.0
