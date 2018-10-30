From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 11:34:19 +0000
Subject: [PATCH] bluetooth: hci_intel: clean an indentation issue, remove extraneous spaces
Message-Id: <20181030113419.12107-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, remove spaces

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bluetooth/hci_intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index 46ace321bf60..c94671c1faf5 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -596,8 +596,8 @@ static int intel_setup(struct hci_uart *hu)
 	 * is in bootloader mode or if it already has operational firmware
 	 * loaded.
 	 */
-	 err = btintel_read_version(hdev, &ver);
-	 if (err)
+	err = btintel_read_version(hdev, &ver);
+	if (err)
 		return err;
 
 	/* The hardware platform number has a fixed value of 0x37 and
-- 
2.19.1
