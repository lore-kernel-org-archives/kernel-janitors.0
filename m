From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Sep 2012 08:21:19 +0000
Subject: [patch] net/key/af_key.c: add range checks on ->sadb_x_policy_len
Message-Id: <20120928082119.GA32008@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Eric Dumazet <eric.dumazet@gmail.com>, Stephen Hemminger <shemminger@vyatta.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Because sizeof() is size_t then if "len" is negative, it counts as a
large positive value.

The call tree looks like:
pfkey_sendmsg()
-> pfkey_process()
   -> pfkey_spdadd()
      -> parse_ipsecrequests()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix.  I'm not very familiar with this code.
I think if we were to hit this then we would try to parse invalid data
and it would return -EINVAL or similar error code pretty quickly.

diff --git a/net/key/af_key.c b/net/key/af_key.c
index 2ca7d7f..7714df0 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -1923,6 +1923,9 @@ parse_ipsecrequests(struct xfrm_policy *xp, struct sadb_x_policy *pol)
 	int len = pol->sadb_x_policy_len*8 - sizeof(struct sadb_x_policy);
 	struct sadb_x_ipsecrequest *rq = (void*)(pol+1);
 
+	if (pol->sadb_x_policy_len * 8 < sizeof(struct sadb_x_policy))
+		return -EINVAL;
+
 	while (len >= sizeof(struct sadb_x_ipsecrequest)) {
 		if ((err = parse_ipsecrequest(xp, rq)) < 0)
 			return err;
