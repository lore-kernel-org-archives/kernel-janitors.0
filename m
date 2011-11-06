From: Julia Lawall <julia@diku.dk>
Date: Sun, 06 Nov 2011 13:26:49 +0000
Subject: [PATCH 4/5] net/rfkill/core.c: use kstrtoul, etc
Message-Id: <1320586010-21931-5-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320586010-21931-1-git-send-email-julia@diku.dk>
In-Reply-To: <1320586010-21931-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kstrtoul, etc instead of the now deprecated strict_strtoul, etc.

A semantic patch rule for the kstrtoul case is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,b;
{int,long} *c;
@@

-strict_strtoul
+kstrtoul
 (a,b,c)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/rfkill/core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/net/rfkill/core.c b/net/rfkill/core.c
--- a/net/rfkill/core.c
+++ b/net/rfkill/core.c
@@ -644,7 +644,7 @@ static ssize_t rfkill_soft_store(struct
 	if (!capable(CAP_NET_ADMIN))
 		return -EPERM;
 
-	err = strict_strtoul(buf, 0, &state);
+	err = kstrtoul(buf, 0, &state);
 	if (err)
 		return err;
 
@@ -688,7 +688,7 @@ static ssize_t rfkill_state_store(struct
 	if (!capable(CAP_NET_ADMIN))
 		return -EPERM;
 
-	err = strict_strtoul(buf, 0, &state);
+	err = kstrtoul(buf, 0, &state);
 	if (err)
 		return err;
 

