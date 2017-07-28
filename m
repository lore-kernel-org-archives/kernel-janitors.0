From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Jul 2017 14:41:11 +0000
Subject: [PATCH] Bluetooth: btrtl: Fix a error code in rtl_load_config()
Message-Id: <20170728144111.chywkq2527puieo6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Gustavo Padovan <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return success if the kmemdup() fails.  It results in
a NULL dereference in the caller.

Fixes: 1110a2dbe698 ("Bluetooth: btrtl: Add RTL8822BE Bluetooth device")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 8279094dd713..d9a99b4302ea 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -279,6 +279,8 @@ static int rtl_load_config(struct hci_dev *hdev, const char *name, u8 **buff)
 		return ret;
 	ret = fw->size;
 	*buff = kmemdup(fw->data, ret, GFP_KERNEL);
+	if (!*buff)
+		ret = -ENOMEM;
 
 	release_firmware(fw);
 
