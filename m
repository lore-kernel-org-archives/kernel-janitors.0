From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sat, 05 May 2007 17:49:16 +0000
Subject: [KJ] Re: removing the last traces of pci_module_init()
Message-Id: <463CC39C.2040003@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> http://fsdev.net/wiki/index.php?title=Stuff_to_be_removed#pci_module_init.28.29
>   
The entry is now removed since it is now removed. The patch for 
/drivers/scsi/tmscsim.c has yet to be included but that should not take 
too long.

So let us celebrate, pci_module_init() is finally _gone_!!!

Cheers
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
