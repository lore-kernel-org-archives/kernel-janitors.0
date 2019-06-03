From: Colin King <colin.king@canonical.com>
Date: Mon, 03 Jun 2019 17:02:47 +0000
Subject: [PATCH][next] bpf: remove redundant assignment to err
Message-Id: <20190603170247.9951-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org, xdp-newbies@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is assigned with the value -EINVAL that is never
read and it is re-assigned a new value later on.  The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/devmap.c | 2 +-
 kernel/bpf/xskmap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 5ae7cce5ef16..a76cc6412fc4 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -88,7 +88,7 @@ static u64 dev_map_bitmap_size(const union bpf_attr *attr)
 static struct bpf_map *dev_map_alloc(union bpf_attr *attr)
 {
 	struct bpf_dtab *dtab;
-	int err = -EINVAL;
+	int err;
 	u64 cost;
 
 	if (!capable(CAP_NET_ADMIN))
diff --git a/kernel/bpf/xskmap.c b/kernel/bpf/xskmap.c
index 22066c28ba61..26859c6c9491 100644
--- a/kernel/bpf/xskmap.c
+++ b/kernel/bpf/xskmap.c
@@ -17,7 +17,7 @@ struct xsk_map {
 
 static struct bpf_map *xsk_map_alloc(union bpf_attr *attr)
 {
-	int cpu, err = -EINVAL;
+	int cpu, err;
 	struct xsk_map *m;
 	u64 cost;
 
-- 
2.20.1
