From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2018 07:58:50 +0000
Subject: [PATCH 2/2] bpf: sockmap, potential uninitialized return in __sock_map_ctx_update_elem()
Message-Id: <20180518075850.GA28335@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "err" might be uninitialized.  That seems
possible.  Anyway we can just return zero.

Fixes: e5cd3abcb31a ("bpf: sockmap, refactor sockmap routines to work with hashmap")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/bpf/sockmap.c b/kernel/bpf/sockmap.c
index c6de1393df63..6298adb3162a 100644
--- a/kernel/bpf/sockmap.c
+++ b/kernel/bpf/sockmap.c
@@ -1821,7 +1821,7 @@ static int __sock_map_ctx_update_elem(struct bpf_map *map,
 		list_add_tail(&e->list, &psock->maps);
 	}
 	write_unlock_bh(&sock->sk_callback_lock);
-	return err;
+	return 0;
 out_free:
 	kfree(e);
 	smap_release_sock(psock, sock);
