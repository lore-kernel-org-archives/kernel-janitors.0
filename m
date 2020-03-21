From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Mar 2020 06:40:48 +0000
Subject: [PATCH] HID: rmi: Simplify an error handling path in 'rmi_hid_read_block()'
Message-Id: <20200321064048.15768-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The 'RMI_READ_REQUEST_PENDING' bit is already cleared in the error handling
path. There is no need to reset it twice.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-rmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 9ce22acdfaca..8cffa84c9650 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -217,7 +217,6 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 		ret = rmi_write_report(hdev, data->writeReport,
 						data->output_report_size);
 		if (ret != data->output_report_size) {
-			clear_bit(RMI_READ_REQUEST_PENDING, &data->flags);
 			dev_err(&hdev->dev,
 				"failed to write request output report (%d)\n",
 				ret);
-- 
2.20.1
