From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 23 Mar 2005 10:20:34 +0000
Subject: [KJ] [PATCH] cleanup : drivers/block/cciss.c
Message-Id: <20050323102034.GB9206@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="XMCwj5IQnwKtuyBG"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
commented printk cleanup.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_cciss.c.diff"

diff -urpN -X dontdiff a/drivers/block/cciss.c b/drivers/block/cciss.c
--- a/drivers/block/cciss.c	2005-03-18 02:34:36.000000000 +0100
+++ b/drivers/block/cciss.c	2005-03-22 16:39:03.000000000 +0100
@@ -1542,9 +1542,6 @@ static int register_new_disk(ctlr_info_t
 
 	if( return_code == IO_OK)
 	{
-		
-		// printk("LUN Data\n--------------------------\n");
-
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[0])) << 24;
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[1])) << 16;
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[2])) << 8;	

--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--XMCwj5IQnwKtuyBG--
