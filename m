From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 29 Apr 2019 13:56:11 +0000
Subject: [PATCH net-next] bpf: Use PTR_ERR_OR_ZERO in bpf_fd_sk_storage_update_elem()
Message-Id: <20190429135611.72640-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/core/bpf_sk_storage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/bpf_sk_storage.c b/net/core/bpf_sk_storage.c
index a8e9ac71b22d..cc9597a87770 100644
--- a/net/core/bpf_sk_storage.c
+++ b/net/core/bpf_sk_storage.c
@@ -708,7 +708,7 @@ static int bpf_fd_sk_storage_update_elem(struct bpf_map *map, void *key,
 	if (sock) {
 		sdata = sk_storage_update(sock->sk, map, value, map_flags);
 		sockfd_put(sock);
-		return IS_ERR(sdata) ? PTR_ERR(sdata) : 0;
+		return PTR_ERR_OR_ZERO(sdata);
 	}
 
 	return err;
