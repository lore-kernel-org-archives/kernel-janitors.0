From: walter harms <wharms@bfs.de>
Date: Tue, 06 Dec 2005 10:49:27 +0000
Subject: [KJ] rfc: print mac addr
Message-Id: <43956CB7.2060904@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi list,

must (if not all) net drivers contain something like this to print a mac 
addr:

for (i = 0; i < 6; i++)
   printk("%2.2x%c", dev->dev_addr[i],i = 5 ? '\n' : ':');

I think it would be usefull to add a helper function.
simple question:
1. is there such a function ?
2. where to add ? each driver ? or is there a common place i do not know 
about ?

re,
  walter

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
