From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 16 Jan 2018 11:27:05 +0000
Subject: [PATCH -next] bpf: cpumap: make some functions static
Message-Id: <1516102025-181063-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

kernel/bpf/cpumap.c:146:6: warning:
 symbol '__cpu_map_queue_destructor' was not declared. Should it be static?
kernel/bpf/cpumap.c:225:16: warning:
 symbol 'cpu_map_build_skb' was not declared. Should it be static?
kernel/bpf/cpumap.c:340:26: warning:
 symbol '__cpu_map_entry_alloc' was not declared. Should it be static?
kernel/bpf/cpumap.c:398:6: warning:
 symbol '__cpu_map_entry_free' was not declared. Should it be static?
kernel/bpf/cpumap.c:441:6: warning:
 symbol '__cpu_map_entry_replace' was not declared. Should it be static?
kernel/bpf/cpumap.c:454:5: warning:
 symbol 'cpu_map_delete_elem' was not declared. Should it be static?
kernel/bpf/cpumap.c:467:5: warning:
 symbol 'cpu_map_update_elem' was not declared. Should it be static?
kernel/bpf/cpumap.c:505:6: warning:
 symbol 'cpu_map_free' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 kernel/bpf/cpumap.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
index ce5b669..d392826 100644
--- a/kernel/bpf/cpumap.c
+++ b/kernel/bpf/cpumap.c
@@ -143,7 +143,7 @@ static struct bpf_map *cpu_map_alloc(union bpf_attr *attr)
 	return ERR_PTR(err);
 }
 
-void __cpu_map_queue_destructor(void *ptr)
+static void __cpu_map_queue_destructor(void *ptr)
 {
 	/* The tear-down procedure should have made sure that queue is
 	 * empty.  See __cpu_map_entry_replace() and work-queue
@@ -222,8 +222,8 @@ static struct xdp_pkt *convert_to_xdp_pkt(struct xdp_buff *xdp)
 	return xdp_pkt;
 }
 
-struct sk_buff *cpu_map_build_skb(struct bpf_cpu_map_entry *rcpu,
-				  struct xdp_pkt *xdp_pkt)
+static struct sk_buff *cpu_map_build_skb(struct bpf_cpu_map_entry *rcpu,
+					 struct xdp_pkt *xdp_pkt)
 {
 	unsigned int frame_size;
 	void *pkt_data_start;
@@ -337,7 +337,8 @@ static int cpu_map_kthread_run(void *data)
 	return 0;
 }
 
-struct bpf_cpu_map_entry *__cpu_map_entry_alloc(u32 qsize, u32 cpu, int map_id)
+static struct bpf_cpu_map_entry *__cpu_map_entry_alloc(u32 qsize, u32 cpu,
+						       int map_id)
 {
 	gfp_t gfp = GFP_ATOMIC|__GFP_NOWARN;
 	struct bpf_cpu_map_entry *rcpu;
@@ -395,7 +396,7 @@ struct bpf_cpu_map_entry *__cpu_map_entry_alloc(u32 qsize, u32 cpu, int map_id)
 	return NULL;
 }
 
-void __cpu_map_entry_free(struct rcu_head *rcu)
+static void __cpu_map_entry_free(struct rcu_head *rcu)
 {
 	struct bpf_cpu_map_entry *rcpu;
 	int cpu;
@@ -438,8 +439,8 @@ void __cpu_map_entry_free(struct rcu_head *rcu)
  * cpu_map_kthread_stop, which waits for an RCU graze period before
  * stopping kthread, emptying the queue.
  */
-void __cpu_map_entry_replace(struct bpf_cpu_map *cmap,
-			     u32 key_cpu, struct bpf_cpu_map_entry *rcpu)
+static void __cpu_map_entry_replace(struct bpf_cpu_map *cmap,
+				    u32 key_cpu, struct bpf_cpu_map_entry *rcpu)
 {
 	struct bpf_cpu_map_entry *old_rcpu;
 
@@ -451,7 +452,7 @@ void __cpu_map_entry_replace(struct bpf_cpu_map *cmap,
 	}
 }
 
-int cpu_map_delete_elem(struct bpf_map *map, void *key)
+static int cpu_map_delete_elem(struct bpf_map *map, void *key)
 {
 	struct bpf_cpu_map *cmap = container_of(map, struct bpf_cpu_map, map);
 	u32 key_cpu = *(u32 *)key;
@@ -464,8 +465,8 @@ int cpu_map_delete_elem(struct bpf_map *map, void *key)
 	return 0;
 }
 
-int cpu_map_update_elem(struct bpf_map *map, void *key, void *value,
-				u64 map_flags)
+static int cpu_map_update_elem(struct bpf_map *map, void *key, void *value,
+			       u64 map_flags)
 {
 	struct bpf_cpu_map *cmap = container_of(map, struct bpf_cpu_map, map);
 	struct bpf_cpu_map_entry *rcpu;
@@ -502,7 +503,7 @@ int cpu_map_update_elem(struct bpf_map *map, void *key, void *value,
 	return 0;
 }
 
-void cpu_map_free(struct bpf_map *map)
+static void cpu_map_free(struct bpf_map *map)
 {
 	struct bpf_cpu_map *cmap = container_of(map, struct bpf_cpu_map, map);
 	int cpu;

