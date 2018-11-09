From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Nov 2018 13:27:36 +0000
Subject: [PATCH] Bluetooth: clean an indentation issue, remove extraneous space
Message-Id: <20181109132736.21166-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/bluetooth/hci_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index e8c9ef1e1922..ca73d36cc149 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1556,7 +1556,7 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 	connectable = (flags & MGMT_ADV_FLAG_CONNECTABLE) ||
 		      mgmt_get_connectable(hdev);
 
-	 if (!is_advertising_allowed(hdev, connectable))
+	if (!is_advertising_allowed(hdev, connectable))
 		return -EPERM;
 
 	/* Set require_privacy to true only when non-connectable
-- 
2.19.1
