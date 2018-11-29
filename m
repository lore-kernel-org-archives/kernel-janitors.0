From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Nov 2018 10:27:03 +0000
Subject: [PATCH net] bpf: uninitialized variables in test code
Message-Id: <20181129102703.2huzlalirskjdl4k@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that if bpf_test_run() fails with -ENOMEM at the
begining then the "duration" is uninitialized.  We then copy the
unintialized variables to the user inside the bpf_test_finish()
function.  The functions require CAP_SYS_ADMIN so it's not really an
information leak.

Fixes: 1cf1cae963c2 ("bpf: introduce BPF_PROG_TEST_RUN command")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/bpf/test_run.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index c89c22c49015..49304192a031 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -114,7 +114,7 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog, const union bpf_attr *kattr,
 	bool is_l2 = false, is_direct_pkt_access = false;
 	u32 size = kattr->test.data_size_in;
 	u32 repeat = kattr->test.repeat;
-	u32 retval, duration;
+	u32 retval, duration = 0;
 	int hh_len = ETH_HLEN;
 	struct sk_buff *skb;
 	struct sock *sk;
@@ -196,7 +196,7 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	u32 repeat = kattr->test.repeat;
 	struct netdev_rx_queue *rxqueue;
 	struct xdp_buff xdp = {};
-	u32 retval, duration;
+	u32 retval, duration = 0;
 	void *data;
 	int ret;
 
-- 
2.11.0
