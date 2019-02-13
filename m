From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 08:23:04 +0000
Subject: [PATCH net] net: dsa: bcm_sf2: potential array overflow in bcm_sf2_sw_suspend()
Message-Id: <20190213082304.GA14113@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The value of ->num_ports comes from bcm_sf2_sw_probe() and it is less
than or equal to DSA_MAX_PORTS.  The ds->ports[] array is used inside
the dsa_is_user_port() and dsa_is_cpu_port() functions.  The ds->ports[]
array is allocated in dsa_switch_alloc() and it has ds->num_ports
elements so this leads to a static checker warning about a potential out
of bounds read.

Fixes: 8cfa94984c9c ("net: dsa: bcm_sf2: add suspend/resume callbacks")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/dsa/bcm_sf2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 5193da67dcdc..98696a88fa1c 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -690,7 +690,7 @@ static int bcm_sf2_sw_suspend(struct dsa_switch *ds)
 	 * port, the other ones have already been disabled during
 	 * bcm_sf2_sw_setup
 	 */
-	for (port = 0; port < DSA_MAX_PORTS; port++) {
+	for (port = 0; port < ds->num_ports; port++) {
 		if (dsa_is_user_port(ds, port) || dsa_is_cpu_port(ds, port))
 			bcm_sf2_port_disable(ds, port, NULL);
 	}
-- 
2.17.1
