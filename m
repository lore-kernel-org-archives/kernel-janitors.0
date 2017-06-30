From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 07:56:26 +0000
Subject: [PATCH] selinux: return -ENOMEM if kzalloc() fails
Message-Id: <20170630075614.ywv3y3tptor5ox7g@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

We accidentally return success instead of -ENOMEM on this failure path.

Fixes: 409dcf31538a ("selinux: Add a cache for quicker retreival of PKey SIDs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/selinux/ibpkey.c b/security/selinux/ibpkey.c
index e3614ee5f1c0..36e61f622b5a 100644
--- a/security/selinux/ibpkey.c
+++ b/security/selinux/ibpkey.c
@@ -160,8 +160,10 @@ static int sel_ib_pkey_sid_slow(u64 subnet_prefix, u16 pkey_num, u32 *sid)
 	 * is valid, it just won't be added to the cache.
 	 */
 	new = kzalloc(sizeof(*new), GFP_ATOMIC);
-	if (!new)
+	if (!new) {
+		ret = -ENOMEM;
 		goto out;
+	}
 
 	new->psec.subnet_prefix = subnet_prefix;
 	new->psec.pkey = pkey_num;
