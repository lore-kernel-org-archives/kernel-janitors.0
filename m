From: Henne <henne@nachtwindheim.de>
Date: Thu, 20 Apr 2006 21:47:32 +0000
Subject: [KJ] Janitortask
Message-Id: <44480174.4090601@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi there,

if somebody is interested in a janitortask, here is one:

Like in <kerneldoc>/pci.txt mentioned, the "struct pci_device_id" in 
drivers should be __devinitdata , to save place.
Each entry of that type takes 28 or 32 bits (depending on the 
architecture), and many drivers are for chips with a handfull of these 
entrys.

A point to start is:
cd <kernelsource>/drivers
fgrep -r "static struct pci_device_id" |grep -v "__devinitdata"

Sure it's better to look for the others like 
__init/_exit/__devinit/__devexit,... too, that make that automagicially.
The ALSA-drivers have been done by me.

Best regards,
Henne

P.S.: Kerneljanitors is a great thing.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
