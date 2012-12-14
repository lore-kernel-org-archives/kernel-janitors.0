From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Dec 2012 15:01:08 +0000
Subject: [patch] pcmcia: i82092: fix i82092aa_pci_remove()
Message-Id: <20121214150107.GA15839@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains because the call to
	pci_set_drvdata(dev, &sockets[i].socket);
is reading one step beyond the end of the sockets[] array.  It will
crash when we use it later.

The only place which uses pci_get_drvdata() is i82092aa_pci_remove().
That function should loop through all the sockets and unregister them.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pcmcia/i82092.c b/drivers/pcmcia/i82092.c
index 3578e1c..519c4d6 100644
--- a/drivers/pcmcia/i82092.c
+++ b/drivers/pcmcia/i82092.c
@@ -133,8 +133,6 @@ static int i82092aa_pci_probe(struct pci_dev *dev, const struct pci_device_id *i
 		goto err_out_free_res;
 	}
 
-	pci_set_drvdata(dev, &sockets[i].socket);
-
 	for (i = 0; i<socket_count; i++) {
 		sockets[i].socket.dev.parent = &dev->dev;
 		sockets[i].socket.ops = &i82092aa_operations;
@@ -164,14 +162,14 @@ err_out_disable:
 
 static void i82092aa_pci_remove(struct pci_dev *dev)
 {
-	struct pcmcia_socket *socket = pci_get_drvdata(dev);
+	int i;
 
 	enter("i82092aa_pci_remove");
 	
 	free_irq(dev->irq, i82092aa_interrupt);
 
-	if (socket)
-		pcmcia_unregister_socket(socket);
+	for (i = 0; i < socket_count; i++)
+		pcmcia_unregister_socket(&sockets[i].socket);
 
 	leave("i82092aa_pci_remove");
 }
