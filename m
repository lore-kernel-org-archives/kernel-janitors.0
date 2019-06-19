From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Jun 2019 16:27:42 +0000
Subject: [PATCH][next] libbpf: fix spelling mistake "conflictling" -> "conflicting"
Message-Id: <20190619162742.985-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several spelling mistakes in pr_warning messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/lib/bpf/libbpf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 4259c9f0cfe7..68f45a96769f 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1169,7 +1169,7 @@ static int bpf_object__init_user_btf_map(struct bpf_object *obj,
 			pr_debug("map '%s': found key_size = %u.\n",
 				 map_name, sz);
 			if (map->def.key_size && map->def.key_size != sz) {
-				pr_warning("map '%s': conflictling key size %u != %u.\n",
+				pr_warning("map '%s': conflicting key size %u != %u.\n",
 					   map_name, map->def.key_size, sz);
 				return -EINVAL;
 			}
@@ -1197,7 +1197,7 @@ static int bpf_object__init_user_btf_map(struct bpf_object *obj,
 			pr_debug("map '%s': found key [%u], sz = %lld.\n",
 				 map_name, t->type, sz);
 			if (map->def.key_size && map->def.key_size != sz) {
-				pr_warning("map '%s': conflictling key size %u != %lld.\n",
+				pr_warning("map '%s': conflicting key size %u != %lld.\n",
 					   map_name, map->def.key_size, sz);
 				return -EINVAL;
 			}
@@ -1212,7 +1212,7 @@ static int bpf_object__init_user_btf_map(struct bpf_object *obj,
 			pr_debug("map '%s': found value_size = %u.\n",
 				 map_name, sz);
 			if (map->def.value_size && map->def.value_size != sz) {
-				pr_warning("map '%s': conflictling value size %u != %u.\n",
+				pr_warning("map '%s': conflicting value size %u != %u.\n",
 					   map_name, map->def.value_size, sz);
 				return -EINVAL;
 			}
@@ -1240,7 +1240,7 @@ static int bpf_object__init_user_btf_map(struct bpf_object *obj,
 			pr_debug("map '%s': found value [%u], sz = %lld.\n",
 				 map_name, t->type, sz);
 			if (map->def.value_size && map->def.value_size != sz) {
-				pr_warning("map '%s': conflictling value size %u != %lld.\n",
+				pr_warning("map '%s': conflicting value size %u != %lld.\n",
 					   map_name, map->def.value_size, sz);
 				return -EINVAL;
 			}
-- 
2.20.1
