From: Colin King <colin.king@canonical.com>
Date: Thu, 03 Dec 2020 11:44:52 +0000
Subject: [PATCH][next] samples/bpf: Fix spelling mistake "recieving" -> "receiving"
Message-Id: <20201203114452.1060017-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Dudek <mariuszx.dudek@intel.com>, Andrii Nakryiko <andrii@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 samples/bpf/xdpsock_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/bpf/xdpsock_user.c b/samples/bpf/xdpsock_user.c
index 0fee7f3aef3c..9553c7c47fc4 100644
--- a/samples/bpf/xdpsock_user.c
+++ b/samples/bpf/xdpsock_user.c
@@ -1570,7 +1570,7 @@ recv_xsks_map_fd(int *xsks_map_fd)
 
 	err = recv_xsks_map_fd_from_ctrl_node(sock, xsks_map_fd);
 	if (err) {
-		fprintf(stderr, "Error %d recieving fd\n", err);
+		fprintf(stderr, "Error %d receiving fd\n", err);
 		return err;
 	}
 	return 0;
-- 
2.29.2
