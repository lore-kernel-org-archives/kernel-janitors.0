From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Aug 2018 11:00:49 +0000
Subject: [PATCH] rxrpc: remove redundant static int 'zero'
Message-Id: <20180809110049.32497-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, "David S . Miller" <davem@davemloft.net>, linux-afs@lists.infradead.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The static int 'zero' is defined but is never used hence it is
redundant and can be removed. The use of this variable was removed
with commit a158bdd3247b ("rxrpc: Fix call timeouts").

Cleans up clang warning:
warning: 'zero' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/rxrpc/sysctl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/rxrpc/sysctl.c b/net/rxrpc/sysctl.c
index 4a7af7aff37d..d75bd15151e6 100644
--- a/net/rxrpc/sysctl.c
+++ b/net/rxrpc/sysctl.c
@@ -15,7 +15,6 @@
 #include "ar-internal.h"
 
 static struct ctl_table_header *rxrpc_sysctl_reg_table;
-static const unsigned int zero = 0;
 static const unsigned int one = 1;
 static const unsigned int four = 4;
 static const unsigned int thirtytwo = 32;
-- 
2.17.1

