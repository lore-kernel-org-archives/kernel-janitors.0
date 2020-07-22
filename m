From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 15:22:24 +0000
Subject: [PATCH] afs: remove redundant assignment to variable ret
Message-Id: <20200722152224.958437-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171120135820.32596-1-colin.king@canonical.com>
In-Reply-To: <20171120135820.32596-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned a value that is never read because
the next statment returns from the function. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/server.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/server.c b/fs/afs/server.c
index e82e452e2612..429cd226e4da 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -701,7 +701,6 @@ bool afs_check_server_record(struct afs_operation *op, struct afs_server *server
 	retries++;
 	if (retries = 4) {
 		_leave(" = f [stale]");
-		ret = -ESTALE;
 		return false;
 	}
 	goto retry;
-- 
2.27.0
