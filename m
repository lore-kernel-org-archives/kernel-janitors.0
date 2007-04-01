From: Jaco Kroon <jaco@kroon.co.za>
Date: Sun, 01 Apr 2007 06:16:21 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <460F4E35.10109@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com> <9c9aa5d00703312224t1948b24bhe34199f19cbda4fb@mail.gmail.com>
In-Reply-To: <9c9aa5d00703312224t1948b24bhe34199f19cbda4fb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pedram M <pmessri@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

Pedram M wrote:
> How about this one? Am I doing it right now?
> If not, please try to explain more to me what I am
> doing wrong.

You need a changelog entry (or explanation of what you're doing). You 
need a signed-off-by line and your patch needs to apply to the root of 
the kernel tree with -p1, something like:

-------------
Replace deprecated pci_find_device call with pci_get_device.

Signed-Off-By: Pedram M <pmessri@gmail.com>

--- linux-2.6.20.3.orig/path/to/file.c     2006-06-24 09:41:08.000000000 
+0200
+++ linux-2.6.20.3/path/to/file.c       2006-07-15 21:01:57.000000000 +0200
@@ -4760,7 +4760,7 @@
  	for (i = 0; i < NR_CARDS; i++) {
  		/* look for a Cyclades card by vendor and device id */
  		while ((device_id = cy_pci_dev_id[dev_index]) != 0) {
-			if ((pdev = pci_find_device(PCI_VENDOR_ID_CYCLADES,
+			if ((pdev = pci_get_device(PCI_VENDOR_ID_CYCLADES,
  						   device_id, pdev)) = NULL) {
  				dev_index++;	/* try next device id */
  			} else {
-------------

And your subject needs to please include the string "[PATCH]", something 
like:  [PATCH] path/to/file.c: pci_find_device cleanup

However, as pointed out, the code itself is incorrect, for every 
pci_get_device there also needs to be a call to pci_put_device in order 
to maintain reference counts.

Your client does not seem to be clobbering the patch itself and 
maintains tabs and line wrapping (unlike my client).

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
