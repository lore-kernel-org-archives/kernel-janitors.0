From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2018 11:48:36 +0000
Subject: [PATCH] test_bpf: Fix NULL vs IS_ERR() check in test_skb_segment()
Message-Id: <20180328114836.GD29050@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Yonghong Song <yhs@fb.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The skb_segment() function returns error pointers on error.  It never
returns NULL.

Fixes: 76db8087c4c9 ("net: bpf: add a test for skb_segment in test_bpf module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index b2badf6b23cd..8e157806df7a 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -6649,7 +6649,7 @@ static __init int test_skb_segment(void)
 	}
 
 	segs = skb_segment(skb, features);
-	if (segs) {
+	if (!IS_ERR(segs)) {
 		kfree_skb_list(segs);
 		ret = 0;
 		pr_info("%s: success in skb_segment!", __func__);
