From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Thu, 08 Feb 2007 12:31:41 +0000
Subject: [KJ] linux-2.6/drivers/ide/pci drivers dont have module_exit
Message-Id: <1170937181.3571.31.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Can someone clarify on this please:
Why is it that all the drivers in linux-2.6/drivers/ide/pci have only
module_init and not module_exit?
Does that mean these drivers cannot be rmmod'ed?
If no then what is the exit point for these?


-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
