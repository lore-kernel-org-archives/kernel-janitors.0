From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 06 May 2020 05:45:57 +0000
Subject: MAINTAINERS: Wrong ordering in S390 PCI SUBSYSTEM
Message-Id: <alpine.DEB.2.21.2005060741520.7719@felia>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Morel <pmorel@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>, Joe Perches <joe@perches.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Pierre,

with your commit de267a7c71ba ("s390/pci: Documentation for zPCI"), 
visible on next-20200505, ./scripts/checkpatch.pl -f MAINTAINERS 
complains:

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
#14723: FILE: MAINTAINERS:14723:
+F:	drivers/pci/hotplug/s390_pci_hpc.c
+F:	Documentation/s390/pci.rst


This is due to wrong ordering of the entries in your submission. If you
would like me to send you a patch fixing that, please just let me know.

It is a recent addition to checkpatch.pl to report ordering problems in 
MAINTAINERS, so you might have not seen that at submission time.


Best regards,

Lukas
