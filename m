From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Oct 2012 07:12:11 +0000
Subject: [patch] cxgb4: allocate enough data in t4_memory_rw()
Message-Id: <20121008071210.GA17400@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitris Michailidis <dm@chelsio.com>, Vipul Pandya <vipul@chelsio.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

MEMWIN0_APERTURE is the size in bytes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This was introduced in 8c357ebd569 "cxgb4: Dynamically allocate memory
in t4_memory_rw() and get_vpd_params()" from Oct 3.

diff --git a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
index 137a244..e914c41 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
@@ -417,7 +417,7 @@ static int t4_memory_rw(struct adapter *adap, int mtype, u32 addr, u32 len,
 	if ((addr & 0x3) || (len & 0x3))
 		return -EINVAL;
 
-	data = vmalloc(MEMWIN0_APERTURE/sizeof(__be32));
+	data = vmalloc(MEMWIN0_APERTURE);
 	if (!data)
 		return -ENOMEM;
 
