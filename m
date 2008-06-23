From: Julia Lawall <julia@diku.dk>
Date: Mon, 23 Jun 2008 21:12:31 +0000
Subject: [PATCH] drivers/net/r6040.c: Eliminate double sizeof
Message-Id: <Pine.LNX.4.64.0806232311570.13402@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: florian.fainelli@telecomint.eu, jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Taking sizeof the result of sizeof is quite strange and does not seem to be
what is wanted here.

This was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E;
@@

- sizeof (
  sizeof (E)
- )
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/net/r6040.c b/drivers/net/r6040.c
--- a/drivers/net/r6040.c 2008-06-17 19:46:52.000000000 +0200
+++ b/drivers/net/r6040.c 2008-06-23 22:55:11.000000000 +0200
@@ -273,7 +273,7 @@ static void r6040_init_ring_desc(struct 
 	dma_addr_t mapping = desc_dma;
 
 	while (size-- > 0) {
-		mapping += sizeof(sizeof(*desc));
+		mapping += sizeof(*desc);
 		desc->ndesc = cpu_to_le32(mapping);
 		desc->vndescp = desc + 1;
 		desc++;
