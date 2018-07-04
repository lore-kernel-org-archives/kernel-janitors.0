From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:52:36 +0000
Subject: [PATCH net] qed: off by one in qed_parse_mcp_trace_buf()
Message-Id: <20180704095236.l3ub5au4jhoihk3g@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, Michal Kalderon <Michal.Kalderon@cavium.com>
Cc: everest-linux-l2@cavium.com, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If format_idx = s_mcp_trace_meta.formats_num then we read one element
beyond the end of the s_mcp_trace_meta.formats[] array.

Fixes: 50bc60cb155c ("qed*: Utilize FW 8.33.11.0")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qed/qed_debug.c b/drivers/net/ethernet/qlogic/qed/qed_debug.c
index a14e48489029..4340c4c90bcb 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_debug.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_debug.c
@@ -6723,7 +6723,7 @@ static enum dbg_status qed_parse_mcp_trace_buf(u8 *trace_buf,
 		format_idx = header & MFW_TRACE_EVENTID_MASK;
 
 		/* Skip message if its index doesn't exist in the meta data */
-		if (format_idx > s_mcp_trace_meta.formats_num) {
+		if (format_idx >= s_mcp_trace_meta.formats_num) {
 			u8 format_size  				(u8)((header & MFW_TRACE_PRM_SIZE_MASK) >>
 				     MFW_TRACE_PRM_SIZE_SHIFT);
