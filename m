From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 20:04:12 +0000
Subject: [PATCH][net-next] net: sched: cls_bpf: use bitwise & rather than logical && on gen_flags
Message-Id: <20171102200412.16757-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently gen_flags is being operated on by a logical && operator rather
than a bitwise & operator. This looks incorrect as these should be bit
flag operations. Fix this.

Detected by CoverityScan, CID#1460305 ("Logical vs. bitwise operator")

Fixes: 3f7889c4c79b ("net: sched: cls_bpf: call block callbacks for offload)
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sched/cls_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/cls_bpf.c b/net/sched/cls_bpf.c
index 5f701c8670a2..bc3edde1b9d7 100644
--- a/net/sched/cls_bpf.c
+++ b/net/sched/cls_bpf.c
@@ -174,7 +174,7 @@ static int cls_bpf_offload_cmd(struct tcf_proto *tp, struct cls_bpf_prog *prog,
 		}
 	}
 
-	if (addorrep && skip_sw && !(prog->gen_flags && TCA_CLS_FLAGS_IN_HW))
+	if (addorrep && skip_sw && !(prog->gen_flags & TCA_CLS_FLAGS_IN_HW))
 		return -EINVAL;
 
 	return 0;
-- 
2.14.1

