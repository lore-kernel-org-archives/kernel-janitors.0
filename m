From: Colin King <colin.king@canonical.com>
Date: Tue, 20 Oct 2020 16:50:29 +0000
Subject: [PATCH] net: dsa: bcm_sf2: make const array static, makes object smaller
Message-Id: <20201020165029.56383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array rate_table on the stack but instead it
static. Makes the object code smaller by 46 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  29812	   3824	    192	  33828	   8424	drivers/net/dsa/bcm_sf2.o

After:
   text	   data	    bss	    dec	    hex	filename
  29670	   3920	    192	  33782	   83f6	drivers/net/dsa/bcm_sf2.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/bcm_sf2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 0b5b2b33b3b6..1e9a0adda2d6 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -54,7 +54,7 @@ static void bcm_sf2_recalc_clock(struct dsa_switch *ds)
 	unsigned long new_rate;
 	unsigned int ports_active;
 	/* Frequenty in Mhz */
-	const unsigned long rate_table[] = {
+	static const unsigned long rate_table[] = {
 		59220000,
 		60820000,
 		62500000,
-- 
2.27.0
