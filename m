From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 20 Jan 2006 17:57:28 +0000
Subject: [KJ] wavelan_cs patch
Message-Id: <20060120175728.GA10203@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95460953959887962=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95460953959887962==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I was doing final review of this patch and I haven't convinced myself
about slottim_low going from 0x20 to 2. The subtle difference between
ifrm_spc and slottim_low cases is that the latter is 3 bits long not 4.
-----------------------------------------------------------------------
[PATCH] wavelan_cs: fix interframe spacing and slot time

From: Jesse Millan <jessem@cs.pdx.edu>

struct i82593_conf_block::ifrm_spc is 4 bits, so 0x20 is not going to
fit into it:

	cfblk.ifrm_spc = 0x20;       /* 32 bit times interframe spacing */

Similar line in drivers/net/znet.c looks like:

	cfblk->ifrm_spc = 6;    /* 96 bit times interframe spacing */

0x20 should be 2; it would match the following identity:

		2     32
	       --- = ----
	        6     96

Similar story with slottim_low. It should be made 2, not 0x20.

We have slottim_hi:slottim_low bitfileds, 3 + 3 bits:

		slottim_hi	slottim_low	comment
wavelan_cs:	    0		     2		   32
znet.c	  :	    2		     0		  512

		0 * 8 + 2      32
	===>   ----------- = -----		<=== Not true
		2 * 8 + 0     512

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>
Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/net/wireless/wavelan_cs.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/net/wireless/wavelan_cs.c
+++ b/drivers/net/wireless/wavelan_cs.c
@@ -3604,8 +3604,8 @@ wv_82593_config(struct net_device *	dev)
   cfblk.lin_prio = 0;   	/* conform to 802.3 backoff algoritm */
   cfblk.exp_prio = 5;	        /* conform to 802.3 backoff algoritm */
   cfblk.bof_met = 1;	        /* conform to 802.3 backoff algoritm */
-  cfblk.ifrm_spc = 0x20;	/* 32 bit times interframe spacing */
-  cfblk.slottim_low = 0x20;	/* 32 bit times slot time */
+  cfblk.ifrm_spc = 2;		/* 32 bit times interframe spacing */
+  cfblk.slottim_low = 2;	/* 32 bit times slot time */
   cfblk.slottim_hi = 0x0;
   cfblk.max_retr = 15;
   cfblk.prmisc = ((lp->promiscuous) ? TRUE: FALSE);	/* Promiscuous mode */


--===============95460953959887962==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95460953959887962==--
