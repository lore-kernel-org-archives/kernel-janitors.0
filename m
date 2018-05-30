From: Colin King <colin.king@canonical.com>
Date: Wed, 30 May 2018 15:09:16 +0000
Subject: [PATCH][next] bpf: devmap: remove redundant assignment of dev = dev
Message-Id: <20180530150916.16808-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment dev = dev is redundant and should be removed.

Detected by CoverityScan, CID#1469486 ("Evaluation order violation")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/devmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index ae16d0c373ef..1fe3fe60508a 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -352,7 +352,7 @@ int dev_map_enqueue(struct bpf_dtab_netdev *dst, struct xdp_buff *xdp,
 static void *dev_map_lookup_elem(struct bpf_map *map, void *key)
 {
 	struct bpf_dtab_netdev *obj = __dev_map_lookup_elem(map, *(u32 *)key);
-	struct net_device *dev = dev = obj ? obj->dev : NULL;
+	struct net_device *dev = obj ? obj->dev : NULL;
 
 	return dev ? &dev->ifindex : NULL;
 }
-- 
2.17.0

