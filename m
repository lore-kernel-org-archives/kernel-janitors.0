From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:18:54 +0000
Subject: [PATCH net] net: dsa: silence a static checker warning
Message-Id: <20191126121854.6omnd7upthqsrwgj@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This code is harmless but it triggers a Smatch static checker warning:

    net/dsa/tag_8021q.c:108 dsa_8021q_restore_pvid()
    error: uninitialized symbol 'pvid'.

I believe that UBSan will complain at run time as well.  The solution is
to just re-order the conditions.

Fixes: c80ed84e7688 ("net: dsa: tag_8021q: Fix dsa_8021q_restore_pvid for an absent pvid")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/dsa/tag_8021q.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dsa/tag_8021q.c b/net/dsa/tag_8021q.c
index 9e5a883a9f0c..4dd1dc27bc98 100644
--- a/net/dsa/tag_8021q.c
+++ b/net/dsa/tag_8021q.c
@@ -106,7 +106,7 @@ static int dsa_8021q_restore_pvid(struct dsa_switch *ds, int port)
 	slave = ds->ports[port].slave;
 
 	err = br_vlan_get_pvid(slave, &pvid);
-	if (!pvid || err < 0)
+	if (err < 0 || !pvid)
 		/* There is no pvid on the bridge for this port, which is
 		 * perfectly valid. Nothing to restore, bye-bye!
 		 */
