From: Julia Lawall <julia@diku.dk>
Date: Sun, 10 Feb 2008 20:16:04 +0000
Subject: [PATCH 8/8] : Use FIELD_SIZEOF
Message-Id: <Pine.LNX.4.64.0802102115100.23906@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vladislav.yasevich@hp.com, sri@us.ibm.com, lksctp-developers@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Robert P.J. Day proposed to use the macro FIELD_SIZEOF in replace of code
that matches its definition.

The modification was made using the following semantic patch
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
type t;
identifier f;
@@

- (sizeof(((t*)0)->f))
+ FIELD_SIZEOF(t, f)

@depends on haskernel@
type t;
identifier f;
@@

- sizeof(((t*)0)->f)
+ FIELD_SIZEOF(t, f)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
--- a/include/net/sctp/sctp.h 2008-02-10 17:13:55.000000000 +0100
+++ b/include/net/sctp/sctp.h 2008-02-10 18:27:30.000000000 +0100
@@ -618,7 +618,7 @@ static inline int param_type2af(__be16 t
 static inline int sctp_sanity_check(void)
 {
 	SCTP_ASSERT(sizeof(struct sctp_ulpevent) <-		    sizeof(((struct sk_buff *)0)->cb),
+		    FIELD_SIZEOF(struct sk_buff, cb),
 		    "SCTP: ulpevent does not fit in skb!\n", return 0);
 
 	return 1;
