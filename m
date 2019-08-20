From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 20 Aug 2019 01:36:52 +0000
Subject: [PATCH -next] bpf: Use PTR_ERR_OR_ZERO in xsk_map_inc()
Message-Id: <20190820013652.147041-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bjorn.topel@intel.com, magnus.karlsson@intel.com, jonathan.lemon@gmail.com, ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 kernel/bpf/xskmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/xskmap.c b/kernel/bpf/xskmap.c
index 4cc28e226398..942c662e2eed 100644
--- a/kernel/bpf/xskmap.c
+++ b/kernel/bpf/xskmap.c
@@ -21,7 +21,7 @@ int xsk_map_inc(struct xsk_map *map)
 	struct bpf_map *m = &map->map;
 
 	m = bpf_map_inc(m, false);
-	return IS_ERR(m) ? PTR_ERR(m) : 0;
+	return PTR_ERR_OR_ZERO(m);
 }
 
 void xsk_map_put(struct xsk_map *map)
