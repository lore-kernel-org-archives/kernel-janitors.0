From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Apr 2019 05:34:16 +0000
Subject: [PATCH net] 6lowpan: Off by one handling ->nexthdr
Message-Id: <20190403053416.GA21913@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Aring <alex.aring@gmail.com>
Cc: Jukka Rissanen <jukka.rissanen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

NEXTHDR_MAX is 255.  What happens here is that we take a u8 value
"hdr->nexthdr" from the network and then look it up in
lowpan_nexthdr_nhcs[].  The problem is that if hdr->nexthdr is 0xff then
we read one element beyond the end of the array so the array needs to
be one element larger.

Fixes: 92aa7c65d295 ("6lowpan: add generic nhc layer interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is the only place which uses the NEXTHDR_MAX define, so I considered
changing that to 256 instead.  Either fix would work.

 net/6lowpan/nhc.c  | 2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/6lowpan/nhc.c b/net/6lowpan/nhc.c
index 4fa2fdda174d..9e56fb98f33c 100644
--- a/net/6lowpan/nhc.c
+++ b/net/6lowpan/nhc.c
@@ -18,7 +18,7 @@
 #include "nhc.h"
 
 static struct rb_root rb_root = RB_ROOT;
-static struct lowpan_nhc *lowpan_nexthdr_nhcs[NEXTHDR_MAX];
+static struct lowpan_nhc *lowpan_nexthdr_nhcs[NEXTHDR_MAX + 1];
 static DEFINE_SPINLOCK(lowpan_nhc_lock);
 
 static int lowpan_nhc_insert(struct lowpan_nhc *nhc)
-- 
2.17.1
