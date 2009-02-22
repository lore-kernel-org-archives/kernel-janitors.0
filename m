From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:05:44 +0000
Subject: [PATCH 15/16] ipv6: fix sparse warning: Using plain integer as NULL
Message-Id: <20090222000541.17557.51181.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  net/ipv6/xfrm6_state.c:72:26: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 net/ipv6/xfrm6_state.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/ipv6/xfrm6_state.c b/net/ipv6/xfrm6_state.c
index 0e685b0..f417b77 100644
--- a/net/ipv6/xfrm6_state.c
+++ b/net/ipv6/xfrm6_state.c
@@ -69,7 +69,7 @@ __xfrm6_sort(void **dst, void **src, int n, int (*cmp)(void *p), int maxclass)
 
 	for (i = 0; i < n; i++) {
 		dst[count[class[i] - 1]++] = src[i];
-		src[i] = 0;
+		src[i] = NULL;
 	}
 
 	return 0;

