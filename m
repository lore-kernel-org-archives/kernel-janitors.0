From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 17 Mar 2005 10:33:27 +0000
Subject: [KJ] [PATCH] printk : drivers/net/tulip/dmfe.c
Message-Id: <20050317103327.GH2102@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="uh9ZiVrAOUUm9fzH"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
printk() calls should include appropriate KERN_* constant.

Have a nice day,

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-printk-linux-2.6.11_drivers_net_tulip_dmfe.c.diff"

diff -urpN -X dontdiff linux-2.6.11-vanilla/drivers/net/tulip/dmfe.c linux-2.6.11/drivers/net/tulip/dmfe.c
--- linux-2.6.11-vanilla/drivers/net/tulip/dmfe.c	2005-03-02 08:38:25.000000000 +0100
+++ linux-2.6.11/drivers/net/tulip/dmfe.c	2005-03-16 14:22:55.000000000 +0100
@@ -451,8 +451,8 @@ static int __devinit dmfe_init_one (stru
 		ent->driver_data >> 16,
 		pci_name(pdev));
 	for (i = 0; i < 6; i++)
-		printk("%c%02x", i ? ':' : ' ', dev->dev_addr[i]);
-	printk(", irq %d.\n", dev->irq);
+		printk(KERN_INFO "%c%02x", i ? ':' : ' ', dev->dev_addr[i]);
+	printk(KERN_INFO ", irq %d.\n", dev->irq);
 
 	pci_set_master(pdev);
 

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--uh9ZiVrAOUUm9fzH--
