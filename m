From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 07:49:46 +0000
Subject: [PATCH] NFC: nci: Remove an unneeded NULL check
Message-Id: <20170614074945.GA29233@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Christophe Ricard <christophe.ricard@gmail.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

"conn_info" can't be NULL here.  Also we just dereferenced it a couple
lines earlier, so that makes static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 61fff422424f..5542fc72f020 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -73,11 +73,9 @@ int nci_get_conn_info_by_dest_type_params(struct nci_dev *ndev, u8 dest_type,
 		if (conn_info->dest_type = dest_type) {
 			if (!params)
 				return conn_info->conn_id;
-			if (conn_info) {
-				if (params->id = conn_info->dest_params->id &&
-				    params->protocol = conn_info->dest_params->protocol)
-					return conn_info->conn_id;
-			}
+			if (params->id = conn_info->dest_params->id &&
+			    params->protocol = conn_info->dest_params->protocol)
+				return conn_info->conn_id;
 		}
 	}
 
