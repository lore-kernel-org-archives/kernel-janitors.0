From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:53:10 +0000
Subject: [Kernel-janitors] [PATCH -mm 9/9] pci_find_device to pci_get_device
Message-Id: <1095749590.3790.99.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96783673418908311=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96783673418908311==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/wan/sdladrv.c linux-2.6.9-rc2-mm1-dsf/drivers/net/wan/sdladrv.c
--- linux-2.6.9-rc2-mm1/drivers/net/wan/sdladrv.c	2004-08-14 03:54:51.000000000 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/wan/sdladrv.c	2004-09-20 23:13:47.707922544 -0700
@@ -2032,7 +2032,7 @@ static int find_s514_adapter(sdlahw_t* h
  
        slot_no = hw->S514_slot_no;
   
-	while ((pci_dev = pci_find_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
+	while ((pci_dev = pci_get_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
         	!= NULL) {
                 
 		pci_read_config_word(pci_dev, PCI_SUBSYS_VENDOR_WORD,
@@ -2043,8 +2043,10 @@ static int find_s514_adapter(sdlahw_t* h
         	
 		hw->pci_dev = pci_dev;
 		
-		if(find_first_S514_card)
+		if(find_first_S514_card) {
+			pci_dev_put(pci_dev);
 			return(1);
+		}
 		
                 number_S514_cards ++;
                 
@@ -2059,6 +2061,7 @@ static int find_s514_adapter(sdlahw_t* h
 			
 		}else if (((pci_dev->devfn >> 3) & PCI_DEV_SLOT_MASK) == slot_no){
                         S514_found_in_slot = 1;
+                        pci_dev_put(pci_dev);
                         break;
                 }
         }
@@ -2245,7 +2248,7 @@ static int pci_probe(sdlahw_t *hw)
  
        slot_no = 0;
   
-	while ((pci_dev = pci_find_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
+	while ((pci_dev = pci_get_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
         	!= NULL) {
 		
                 pci_read_config_word(pci_dev, PCI_SUBSYS_VENDOR_WORD,



--===============96783673418908311==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96783673418908311==--
