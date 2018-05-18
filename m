From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2018 07:58:10 +0000
Subject: [PATCH 1/2] bpf: sockmap, double free in __sock_map_ctx_update_elem()
Message-Id: <20180518075810.GA28285@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally free "e" twice.

Fixes: 81110384441a ("bpf: sockmap, add hash map support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/bpf/sockmap.c b/kernel/bpf/sockmap.c
index c6de1393df63..216d5c9b0eb3 100644
--- a/kernel/bpf/sockmap.c
+++ b/kernel/bpf/sockmap.c
@@ -1833,7 +1833,6 @@ static int __sock_map_ctx_update_elem(struct bpf_map *map,
 	if (tx_msg)
 		bpf_prog_put(tx_msg);
 	write_unlock_bh(&sock->sk_callback_lock);
-	kfree(e);
 	return err;
 }
 
