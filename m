From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:48:49 +0000
Subject: [patch] net: make ndev->irq signed for error handling
Message-Id: <20131107074849.GF21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a bug in cpsw_probe() where we do:

	ndev->irq = platform_get_irq(pdev, 0);
	if (ndev->irq < 0) {

The problem is that "ndev->irq" is unsigned so the error handling
doesn't work.  I have changed it to a regular int.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9da6a04..bb011f6 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1132,7 +1132,7 @@ struct net_device {
 	unsigned long		mem_end;	/* shared mem end	*/
 	unsigned long		mem_start;	/* shared mem start	*/
 	unsigned long		base_addr;	/* device I/O address	*/
-	unsigned int		irq;		/* device IRQ number	*/
+	int			irq;		/* device IRQ number	*/
 
 	/*
 	 *	Some hardware also needs these fields, but they are not
