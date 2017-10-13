From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Oct 2017 11:29:59 +0000
Subject: [PATCH] thunderbolt: Fix some right shifting to zero bugs
Message-Id: <20171013112959.sc2pwazrpk7fxbtw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The problematic code looks like this:

	res_seq = res_hdr->xd_hdr.length_sn & TB_XDOMAIN_SN_MASK;
	res_seq >>= TB_XDOMAIN_SN_SHIFT;

TB_XDOMAIN_SN_SHIFT is 27, and right shifting a u8 27 bits is always
going to result in zero.  The fix is to declare these variables as u32.

Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index f2d06f6f7be9..c6ca170e1f4f 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -56,7 +56,7 @@ static bool tb_xdomain_match(const struct tb_cfg_request *req,
 	case TB_CFG_PKG_XDOMAIN_RESP: {
 		const struct tb_xdp_header *res_hdr = pkg->buffer;
 		const struct tb_xdp_header *req_hdr = req->request;
-		u8 req_seq, res_seq;
+		u32 req_seq, res_seq;
 
 		if (pkg->frame.size < req->response_size / 4)
 			return false;
@@ -476,7 +476,7 @@ static void tb_xdp_handle_request(struct work_struct *work)
 	struct tb_ctl *ctl = tb->ctl;
 	const uuid_t *uuid;
 	int ret = 0;
-	u8 sequence;
+	u32 sequence;
 	u64 route;
 
 	route = ((u64)xhdr->route_hi << 32 | xhdr->route_lo) & ~BIT_ULL(63);
diff --git a/drivers/net/thunderbolt.c b/drivers/net/thunderbolt.c
index 1a7bc0bf4598..435854688a7a 100644
--- a/drivers/net/thunderbolt.c
+++ b/drivers/net/thunderbolt.c
@@ -394,7 +394,7 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 	struct tbnet *net = data;
 	u32 command_id;
 	int ret = 0;
-	u8 sequence;
+	u32 sequence;
 	u64 route;
 
 	/* Make sure the packet is for us */
