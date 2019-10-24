From: Colin King <colin.king@canonical.com>
Date: Thu, 24 Oct 2019 10:32:18 +0000
Subject: [PATCH][next] net: dsa: fix dereference on ds->dev before null check error
Message-Id: <20191024103218.2592-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently ds->dev is dereferenced on the assignments of pdata and
np before ds->dev is null checked, hence there is a potential null
pointer dereference on ds->dev.  Fix this by assigning pdata and
np after the ds->dev null pointer sanity check.

Addresses-Coverity: ("Dereference before null check")
Fixes: 7e99e3470172 ("net: dsa: remove dsa_switch_alloc helper")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/dsa/dsa2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 1e3ac9b56c89..214dd703b0cc 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -842,13 +842,16 @@ static int dsa_switch_add(struct dsa_switch *ds)
 
 static int dsa_switch_probe(struct dsa_switch *ds)
 {
-	struct dsa_chip_data *pdata = ds->dev->platform_data;
-	struct device_node *np = ds->dev->of_node;
+	struct dsa_chip_data *pdata;
+	struct device_node *np;
 	int err;
 
 	if (!ds->dev)
 		return -ENODEV;
 
+	pdata = ds->dev->platform_data;
+	np = ds->dev->of_node;
+
 	if (!ds->num_ports)
 		return -EINVAL;
 
-- 
2.20.1
