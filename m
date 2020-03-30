From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 30 Mar 2020 10:26:31 +0000
Subject: [PATCH net] veth: xdp: use head instead of hard_start
Message-Id: <20200330102631.31286-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, ast@kernel.org, daniel@iogearbox.net, kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, jwi@linux.ibm.com, toshiaki.makita1@gmail.com, jianglidong3@jd.com, edumazet@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

xdp.data_hard_start is mapped to the first
address of xdp_frame, but the pointer hard_start
is the offset(sizeof(struct xdp_frame)) of xdp_frame,
it should use head instead of hard_start to
set xdp.data_hard_start. Otherwise, if BPF program
calls helper_function such as bpf_xdp_adjust_head, it
will be confused for xdp_frame_end.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/veth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index d4cbb9e8c63f..5ea550884bf8 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -506,7 +506,7 @@ static struct sk_buff *veth_xdp_rcv_one(struct veth_rq *rq,
 		struct xdp_buff xdp;
 		u32 act;
 
-		xdp.data_hard_start = hard_start;
+		xdp.data_hard_start = head;
 		xdp.data = frame->data;
 		xdp.data_end = frame->data + frame->len;
 		xdp.data_meta = frame->data - frame->metasize;
-- 
2.20.1
