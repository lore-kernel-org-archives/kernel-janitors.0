From: Julia Lawall <julia@diku.dk>
Date: Wed, 05 Aug 2009 12:34:55 +0000
Subject: [PATCH 2/2] security/smack: Use AF_INET for sin_family field
Message-Id: <Pine.LNX.4.64.0908051434340.20453@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Elsewhere the sin_family field holds a value with a name of the form
AF_..., so it seems reasonable to do so here as well.  Also the values of
PF_INET and AF_INET are the same.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
struct sockaddr_in sip;
@@

(
sip.sin_family =
- PF_INET
+ AF_INET
|
sip.sin_family !- PF_INET
+ AF_INET
|
sip.sin_family - PF_INET
+ AF_INET
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 security/smack/smack_lsm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -2464,7 +2464,7 @@ static int smack_socket_sendmsg(struct s
 	/*
 	 * Perfectly reasonable for this to be NULL
 	 */
-	if (sip = NULL || sip->sin_family != PF_INET)
+	if (sip = NULL || sip->sin_family != AF_INET)
 		return 0;
 
 	return smack_netlabel_send(sock->sk, sip);
