From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:04:08 +0000
Subject: [KJ] [PATCH] drivers/input/serio/* : pci_request_regions
Message-Id: <20050214150408.GI20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6BvahUXLYAruDZOj"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--6BvahUXLYAruDZOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>



--6BvahUXLYAruDZOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_input_serio.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/input/serio/pcips2.c linux-2.6.11-rc4/drivers/input/serio/pcips2.c
--- linux-2.6.11-rc4-vanilla/drivers/input/serio/pcips2.c	2004-12-24 22:34:26.000000000 +0100
+++ linux-2.6.11-rc4/drivers/input/serio/pcips2.c	2005-02-14 09:46:39.000000000 +0100
@@ -131,14 +131,17 @@ static int __devinit pcips2_probe(struct
 	struct pcips2_data *ps2if;
 	struct serio *serio;
 	int ret;
+	int pci_dev_busy = 0 ;
 
 	ret = pci_enable_device(dev);
 	if (ret)
 		goto out;
 
 	ret = pci_request_regions(dev, "pcips2");
-	if (ret)
+	if (ret) {
+		pci_dev_busy = 1;
 		goto disable;
+	}
 
 	ps2if = kmalloc(sizeof(struct pcips2_data), GFP_KERNEL);
 	serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
@@ -172,7 +175,8 @@ static int __devinit pcips2_probe(struct
 	kfree(serio);
 	pci_release_regions(dev);
  disable:
-	pci_disable_device(dev);
+	if(!pci_dev_busy)
+		pci_disable_device(dev);
  out:
 	return ret;
 }

--6BvahUXLYAruDZOj
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--6BvahUXLYAruDZOj--
