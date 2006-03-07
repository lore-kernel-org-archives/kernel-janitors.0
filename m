From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Tue, 07 Mar 2006 07:58:20 +0000
Subject: [KJ][Patch] change for to while(1) in 3c515.c
Message-Id: <1141718301.8347.16.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56967769249007927=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56967769249007927==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

from http://linuxicc.sourceforge.net/

ICC complains about: Pointless comparison of unsigned integer with zero.
@ line 1028 of 3c515.c


1007                 unsigned long flags, i;


1028                 for (i = 20; i >= 0; i--)
1029                         if ((inw(ioaddr + EL3_STATUS) & CmdInProgress) == 0) 
1030                                 break;

This makes the 'for' loop effectively 'while (1)' as i >= 0 cant fail.
This seems like a reasonable objective as the loop seems to be waiting for a command to finish.

As it is the current behaviour, and to make the code more readable, the patch below replaces the 'for' with a 'while(1)'
and removes the 'unsigned long i', as it is no longer used.

Compile tested.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/net/3c515.c.orig	2006-03-07 18:17:13.000000000 +1100
+++ linux-2.6.16-rc5/drivers/net/3c515.c	2006-03-07 18:19:55.000000000 +1100
@@ -1004,7 +1004,7 @@ static int corkscrew_start_xmit(struct s
 		/* Calculate the next Tx descriptor entry. */
 		int entry = vp->cur_tx % TX_RING_SIZE;
 		struct boom_tx_desc *prev_entry;
-		unsigned long flags, i;
+		unsigned long flags;
 
 		if (vp->tx_full)	/* No room to transmit with */
 			return 1;
@@ -1025,7 +1025,7 @@ static int corkscrew_start_xmit(struct s
 		spin_lock_irqsave(&vp->lock, flags);
 		outw(DownStall, ioaddr + EL3_CMD);
 		/* Wait for the stall to complete. */
-		for (i = 20; i >= 0; i--)
+		while (1)
 			if ((inw(ioaddr + EL3_STATUS) & CmdInProgress) == 0) 
 				break;
 		if (prev_entry)


 


--===============56967769249007927==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56967769249007927==--
