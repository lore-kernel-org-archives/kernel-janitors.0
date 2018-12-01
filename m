From: Roman Gushchin <guro@fb.com>
Date: Sat, 01 Dec 2018 19:13:50 +0000
Subject: Re: [PATCH net] bpf: uninitialized variables in test code
Message-Id: <20181201191341.GA4112@castle.DHCP.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129102703.2huzlalirskjdl4k@kili.mountain>
 <20181130225801.7adzjdjkn5cirq4s@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20181130225801.7adzjdjkn5cirq4s@ast-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Nov 30, 2018 at 02:58:03PM -0800, Alexei Starovoitov wrote:
> On Thu, Nov 29, 2018 at 01:27:03PM +0300, Dan Carpenter wrote:
> > Smatch complains that if bpf_test_run() fails with -ENOMEM at the
> > begining then the "duration" is uninitialized.  We then copy the
> > unintialized variables to the user inside the bpf_test_finish()
> > function.  The functions require CAP_SYS_ADMIN so it's not really an
> > information leak.
> > 
> > Fixes: 1cf1cae963c2 ("bpf: introduce BPF_PROG_TEST_RUN command")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> That is incorrect fixes tag.
> It should be pointing to commit f42ee093be29 ("bpf/test_run: support cgroup local storage")
> 
> bpf_test_run() can only return the value that bpf program returned.
> It cannot return -ENOMEM.
> That code needs to be refactored.
> I think the proper way for bpf_test_run() would be to return 0 or -ENOMEM
> and store bpf's retval into extra pointer.
> Proper checks need to be added in the callers (bpf_prog_test_run_skb, etc).

Makes total sense. How about this patch?

Thanks!

--

From a2832f56c621d7809da8d4196877fa01621055f5 Mon Sep 17 00:00:00 2001
From: Roman Gushchin <guro@fb.com>
Date: Sat, 1 Dec 2018 10:39:44 -0800
Subject: [PATCH bpf] bpf: refactor bpf_test_run() to separate own failures and
 test program result

After commit f42ee093be29 ("bpf/test_run: support cgroup local
storage") the bpf_test_run() function may fail with -ENOMEM, if
it's not possible to allocate memory for a cgroup local storage.

This error shouldn't be mixed with the return value of the testing
program. Let's add an additional argument with a pointer where to
store the testing program's result; and make bpf_test_run()
return either 0 or -ENOMEM.

Fixes: f42ee093be29 ("bpf/test_run: support cgroup local storage")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Roman Gushchin <guro@fb.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Alexei Starovoitov <ast@kernel.org>
---
 net/bpf/test_run.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index c89c22c49015..8bce7d8d00d9 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -28,12 +28,13 @@ static __always_inline u32 bpf_test_run_one(struct bpf_prog *prog, void *ctx,
 	return ret;
 }
 
-static u32 bpf_test_run(struct bpf_prog *prog, void *ctx, u32 repeat, u32 *time)
+static u32 bpf_test_run(struct bpf_prog *prog, void *ctx, u32 repeat, u32 *ret,
+			u32 *time)
 {
 	struct bpf_cgroup_storage *storage[MAX_BPF_CGROUP_STORAGE_TYPE] = { 0 };
 	enum bpf_cgroup_storage_type stype;
 	u64 time_start, time_spent = 0;
-	u32 ret = 0, i;
+	u32 i;
 
 	for_each_cgroup_storage_type(stype) {
 		storage[stype] = bpf_cgroup_storage_alloc(prog, stype);
@@ -49,7 +50,7 @@ static u32 bpf_test_run(struct bpf_prog *prog, void *ctx, u32 repeat, u32 *time)
 		repeat = 1;
 	time_start = ktime_get_ns();
 	for (i = 0; i < repeat; i++) {
-		ret = bpf_test_run_one(prog, ctx, storage);
+		*ret = bpf_test_run_one(prog, ctx, storage);
 		if (need_resched()) {
 			if (signal_pending(current))
 				break;
@@ -65,7 +66,7 @@ static u32 bpf_test_run(struct bpf_prog *prog, void *ctx, u32 repeat, u32 *time)
 	for_each_cgroup_storage_type(stype)
 		bpf_cgroup_storage_free(storage[stype]);
 
-	return ret;
+	return 0;
 }
 
 static int bpf_test_finish(const union bpf_attr *kattr,
@@ -165,7 +166,12 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog, const union bpf_attr *kattr,
 		__skb_push(skb, hh_len);
 	if (is_direct_pkt_access)
 		bpf_compute_data_pointers(skb);
-	retval = bpf_test_run(prog, skb, repeat, &duration);
+	ret = bpf_test_run(prog, skb, repeat, &retval, &duration);
+	if (ret) {
+		kfree(data);
+		kfree(sk);
+		return ret;
+	}
 	if (!is_l2) {
 		if (skb_headroom(skb) < hh_len) {
 			int nhead = HH_DATA_ALIGN(hh_len - skb_headroom(skb));
@@ -212,11 +218,14 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	rxqueue = __netif_get_rx_queue(current->nsproxy->net_ns->loopback_dev, 0);
 	xdp.rxq = &rxqueue->xdp_rxq;
 
-	retval = bpf_test_run(prog, &xdp, repeat, &duration);
+	ret = bpf_test_run(prog, &xdp, repeat, &retval, &duration);
+	if (ret)
+		goto out;
 	if (xdp.data != data + XDP_PACKET_HEADROOM + NET_IP_ALIGN ||
 	    xdp.data_end != xdp.data + size)
 		size = xdp.data_end - xdp.data;
 	ret = bpf_test_finish(kattr, uattr, xdp.data, size, retval, duration);
+out:
 	kfree(data);
 	return ret;
 }
-- 
2.17.2
