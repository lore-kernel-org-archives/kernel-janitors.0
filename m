From: "Pedram M" <pmessri@gmail.com>
Date: Sun, 01 Apr 2007 05:24:12 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <9c9aa5d00703312224t1948b24bhe34199f19cbda4fb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
In-Reply-To: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

How about this one? Am I doing it right now?
If not, please try to explain more to me what I am
doing wrong.

@@ -4760,7 +4760,7 @@
 	for (i = 0; i < NR_CARDS; i++) {
 		/* look for a Cyclades card by vendor and device id */
 		while ((device_id = cy_pci_dev_id[dev_index]) != 0) {
-			if ((pdev = pci_find_device(PCI_VENDOR_ID_CYCLADES,
+			if ((pdev = pci_get_device(PCI_VENDOR_ID_CYCLADES,
 						   device_id, pdev)) = NULL) {
 				dev_index++;	/* try next device id */
 			} else {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
