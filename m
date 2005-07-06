From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 06 Jul 2005 23:46:57 +0000
Subject: [KJ] GCC4 wavelan_cs.c warning: large integer implicitly truncated
Message-Id: <42CC6D71.7090605@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080100070706040107000704"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080100070706040107000704
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------080100070706040107000704
Content-Type: text/x-diff; x-mac-type="0"; x-mac-creator="0";
	name="wavelan_cs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="wavelan_cs.patch"



ifrm_spc is a 4 bit wide bitfield. Trying to assign the 6 bit value 0x20
to it results in the compiler chopping off the first 2 bits and assigning
the remaining 4 bits (all zeros) to it. Similar story for slottim_low.

I don't think that was the intended purpose. I am not a driver writer,
but by comparing the comments by the assignment along with the code in a
similar driver (znet.c), it looks as if the assignment should be 0x2 not
0x20 i.e. 2*16 is "32 bit times the interframe spacing" not 32*16. 0x20
is 32*16, which seems to be 512 bit times the interframe spacing.

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>
---


diff -puN drivers/net/wireless/wavelan_cs.c~wavelan_cs drivers/net/wireless/wavelan_cs.c
--- linux-2.6.13-rc2.kj.jm.gcc4/drivers/net/wireless/wavelan_cs.c~wavelan_cs	2005-07-06 15:54:23.107182264 -0700
+++ linux-2.6.13-rc2.kj.jm.gcc4-jessem/drivers/net/wireless/wavelan_cs.c	2005-07-06 16:45:04.972748408 -0700
@@ -3604,8 +3604,8 @@ wv_82593_config(struct net_device *	dev)
   cfblk.lin_prio = 0;   	/* conform to 802.3 backoff algoritm */
   cfblk.exp_prio = 5;	        /* conform to 802.3 backoff algoritm */
   cfblk.bof_met = 1;	        /* conform to 802.3 backoff algoritm */
-  cfblk.ifrm_spc = 0x20;	/* 32 bit times interframe spacing */
-  cfblk.slottim_low = 0x20;	/* 32 bit times slot time */
+  cfblk.ifrm_spc = 0x2;	/* 32 bit times interframe spacing */
+  cfblk.slottim_low = 0x2;	/* 32 bit times slot time */
   cfblk.slottim_hi = 0x0;
   cfblk.max_retr = 15;
   cfblk.prmisc = ((lp->promiscuous) ? TRUE: FALSE);	/* Promiscuous mode */
_


--------------080100070706040107000704
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080100070706040107000704--
