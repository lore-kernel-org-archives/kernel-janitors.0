From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 11:36:15 +0000
Subject: [PATCH net-next] ibmvnic: Potential NULL dereference in clean_one_tx_pool()
Message-Id: <20180323113615.GA28518@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
Cc: John Allen <jallen@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

There is an && vs || typo here, which potentially leads to a NULL
dereference.

Fixes: e9e1e97884b7 ("ibmvnic: Update TX pool cleaning routine")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5632c030811b..0389a7a52152 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1135,7 +1135,7 @@ static void clean_one_tx_pool(struct ibmvnic_adapter *adapter,
 	u64 tx_entries;
 	int i;
 
-	if (!tx_pool && !tx_pool->tx_buff)
+	if (!tx_pool || !tx_pool->tx_buff)
 		return;
 
 	tx_entries = tx_pool->num_buffers;
