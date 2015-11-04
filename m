From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 13:37:28 +0000
Subject: [patch] NFC: nci: memory leak in nci_core_conn_create()
Message-Id: <20151104133728.GG20966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Robert Dolca <robert.dolca@intel.com>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, Christophe Ricard <christophe.ricard@gmail.com>, Julien Lefrique <lefrique@marvell.com>, Robert Baldyga <r.baldyga@samsung.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

I've moved the check for "number_destination_params" forward a few lines
to avoid leaking "cmd".

Fixes: caa575a86ec1 ('NFC: nci: fix possible crash in nci_core_conn_create')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 10c99a5..fbb7a2b 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -610,14 +610,14 @@ int nci_core_conn_create(struct nci_dev *ndev, u8 destination_type,
 	struct nci_core_conn_create_cmd *cmd;
 	struct core_conn_create_data data;
 
+	if (!number_destination_params)
+		return -EINVAL;
+
 	data.length = params_len + sizeof(struct nci_core_conn_create_cmd);
 	cmd = kzalloc(data.length, GFP_KERNEL);
 	if (!cmd)
 		return -ENOMEM;
 
-	if (!number_destination_params)
-		return -EINVAL;
-
 	cmd->destination_type = destination_type;
 	cmd->number_destination_params = number_destination_params;
 	memcpy(cmd->params, params, params_len);
