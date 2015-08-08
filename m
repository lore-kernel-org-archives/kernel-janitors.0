From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Aug 2015 19:15:59 +0000
Subject: [patch 2/2] cxgb4: cleanup some indenting
Message-Id: <20150808191559.GC8034@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hariprasad S <hariprasad@chelsio.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Add or remove some tabs so that statements line up correctly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
index 9e0b670..b83ca7f 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
@@ -346,11 +346,11 @@ static int cim_qcfg_show(struct seq_file *seq, void *v)
 		if (is_t4(adap->params.chip)) {
 			i = t4_cim_read(adap, UP_OBQ_0_REALADDR_A,
 					ARRAY_SIZE(obq_wr_t4), obq_wr_t4);
-				wr = obq_wr_t4;
+			wr = obq_wr_t4;
 		} else {
 			i = t4_cim_read(adap, UP_OBQ_0_SHADOW_REALADDR_A,
 					ARRAY_SIZE(obq_wr_t5), obq_wr_t5);
-				wr = obq_wr_t5;
+			wr = obq_wr_t5;
 		}
 	}
 	if (i)
@@ -2095,7 +2095,7 @@ do { \
 #undef T
 #undef S
 #undef S3
-return 0;
+	return 0;
 }
 
 static int sge_queue_entries(const struct adapter *adap)
