From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Nov 2011 06:17:22 +0000
Subject: [patch] caif: fix endian conversion in cffrml_transmit()
Message-Id: <20111121061722.GD7354@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur Braendeland <sjur.brandeland@stericsson.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "tmp" variable here is used to store the result of cpu_to_le16()
so it should be a u16 instead of an int.  We want the high bits set
and the current code works on little endian systems but not on big
endian systems.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker thing.  I haven't tested it.  Please review
carefully.

diff --git a/net/caif/cffrml.c b/net/caif/cffrml.c
index f399211..2b46c48 100644
--- a/net/caif/cffrml.c
+++ b/net/caif/cffrml.c
@@ -136,10 +136,11 @@ static int cffrml_receive(struct cflayer *layr, struct cfpkt *pkt)
 
 static int cffrml_transmit(struct cflayer *layr, struct cfpkt *pkt)
 {
-	int tmp;
+	u16 tmp;
 	u16 chks;
 	u16 len;
 	struct cffrml *this = container_obj(layr);
+
 	if (this->dofcs) {
 		chks = cfpkt_iterate(pkt, cffrml_checksum, 0xffff);
 		tmp = cpu_to_le16(chks);
