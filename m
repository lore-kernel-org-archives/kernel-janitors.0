From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:35:37 +0000
Subject: [PATCH] xfrm: NULL dereference on allocation failure
Message-Id: <20170614103537.GJ29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Trent Jaeger <tjaeger@cse.psu.edu>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The default error code in pfkey_msg2xfrm_state() is -ENOBUFS.  We
added a new call to security_xfrm_state_alloc() which sets "err" to zero
so there several places where we can return ERR_PTR(0) if kmalloc()
fails.  The caller is expecting error pointers so it leads to a NULL
dereference.

Fixes: df71837d5024 ("[LSM-IPSec]: Security association restriction.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/key/af_key.c b/net/key/af_key.c
index 86051b5879f2..02e6865421e8 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -1157,6 +1157,7 @@ static struct xfrm_state * pfkey_msg2xfrm_state(struct net *net,
 			goto out;
 	}
 
+	err = -ENOBUFS;
 	key = ext_hdrs[SADB_EXT_KEY_AUTH - 1];
 	if (sa->sadb_sa_auth) {
 		int keysize = 0;
