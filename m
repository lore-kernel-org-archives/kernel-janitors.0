From: "Carlo Perassi" <carlo@linux.it>
Date: Tue, 09 Aug 2005 09:44:09 +0000
Subject: [KJ] excessive permissions
Message-Id: <32819.158.102.162.5.1123580649.squirrel@picard.linux.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I noticed the permissions of the following files
linux-2.6.13-rc6/drivers/net/amd8111e.c
linux-2.6.13-rc6/drivers/net/amd8111e.h
linux-2.6.13-rc6/drivers/mtd/nand/sharpsl.c
are set to 755.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
