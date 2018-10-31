From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Oct 2018 16:46:02 +0000
Subject: [PATCH] pcmcia:  clean an indentation issues, remove extraneous spaces
Message-Id: <20181031164602.28738-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up indentation issues, remove spaces

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pcmcia/i82092.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/pcmcia/i82092.c b/drivers/pcmcia/i82092.c
index aae7e6df99cd..7cebea482200 100644
--- a/drivers/pcmcia/i82092.c
+++ b/drivers/pcmcia/i82092.c
@@ -430,27 +430,25 @@ static int i82092aa_get_status(struct pcmcia_socket *socket, u_int *value)
 		
 	/* IO cards have a different meaning of bits 0,1 */
 	/* Also notice the inverse-logic on the bits */
-	 if (indirect_read(sock, I365_INTCTL) & I365_PC_IOCARD)	{
-	 	/* IO card */
-	 	if (!(status & I365_CS_STSCHG))
-	 		*value |= SS_STSCHG;
-	 } else { /* non I/O card */
-	 	if (!(status & I365_CS_BVD1))
-	 		*value |= SS_BATDEAD;
-	 	if (!(status & I365_CS_BVD2))
-	 		*value |= SS_BATWARN;
-	 		
-	 }
+	if (indirect_read(sock, I365_INTCTL) & I365_PC_IOCARD)	{
+		/* IO card */
+		if (!(status & I365_CS_STSCHG))
+			*value |= SS_STSCHG;
+	} else { /* non I/O card */
+		if (!(status & I365_CS_BVD1))
+			*value |= SS_BATDEAD;
+		if (!(status & I365_CS_BVD2))
+			*value |= SS_BATWARN;
+	}
 	 
-	 if (status & I365_CS_WRPROT)
-	 	(*value) |= SS_WRPROT;	/* card is write protected */
+	if (status & I365_CS_WRPROT)
+		(*value) |= SS_WRPROT;	/* card is write protected */
 	 
-	 if (status & I365_CS_READY)
-	 	(*value) |= SS_READY;    /* card is not busy */
+	if (status & I365_CS_READY)
+		(*value) |= SS_READY;    /* card is not busy */
 	 	
-	 if (status & I365_CS_POWERON)
-	 	(*value) |= SS_POWERON;  /* power is applied to the card */
-
+	if (status & I365_CS_POWERON)
+		(*value) |= SS_POWERON;  /* power is applied to the card */
 
 	leave("i82092aa_get_status");
 	return 0;
-- 
2.19.1
