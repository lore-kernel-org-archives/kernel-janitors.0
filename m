From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Nov 2014 06:21:40 +0000
Subject: [patch -mainline] netfilter: ipset: small potential read beyond the end of buffer
Message-Id: <20141107062140.GA10905@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, Sergey Popovich <popovich_sergei@mail.ru>, Masanari Iida <standby24x7@gmail.com>, Anton Danilov <littlesmilingcloud@gmail.com>, stephen hemminger <stephen@networkplumber.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernddel.org, kernel-janitors@vger.kernel.org

We could be reading 8 bytes into a 4 byte buffer here.  It seems
harmless but adding a check is the right thing to do and it silences a
static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index 86f9d76..ac08a3f 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -1863,7 +1863,8 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
 	if (*op < IP_SET_OP_VERSION) {
 		/* Check the version at the beginning of operations */
 		struct ip_set_req_version *req_version = data;
-		if (req_version->version != IPSET_PROTOCOL) {
+		if (*len < sizeof(struct ip_set_req_version) ||
+		    req_version->version != IPSET_PROTOCOL) {
 			ret = -EPROTO;
 			goto done;
 		}
