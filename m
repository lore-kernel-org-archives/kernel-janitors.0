From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Nov 2018 09:29:26 +0000
Subject: [PATCH][bpf-next] bpf: fix null pointer dereference on pointer offload
Message-Id: <20181113092926.27081-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer offload is being null checked however the following statement
dereferences the potentially null pointer offload when assigning
offload->dev_state.  Fix this by only assigning it if offload is not
null.

Detected by CoverityScan, CID#1475437 ("Dereference after null check")

Fixes: 00db12c3d141 ("bpf: call verifier_prep from its callback in struct bpf_offload_dev")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/offload.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index 52c5617e3716..54cf2b9c44a4 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -130,9 +130,10 @@ int bpf_prog_offload_verifier_prep(struct bpf_prog *prog)
 
 	down_read(&bpf_devs_lock);
 	offload = prog->aux->offload;
-	if (offload)
+	if (offload) {
 		ret = offload->offdev->ops->prepare(prog);
-	offload->dev_state = !ret;
+		offload->dev_state = !ret;
+	}
 	up_read(&bpf_devs_lock);
 
 	return ret;
-- 
2.19.1
