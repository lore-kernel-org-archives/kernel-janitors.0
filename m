From: Amit Gud <amitg@calsoftinc.com>
Date: Tue, 25 Jan 2005 11:46:21 +0000
Subject: [KJ] [PATCH] unified spinlock initialization arch/mips/kernel/irq.c
Message-Id: <200501251704.22504.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72003848057142594=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, gud@eth.net

--===============72003848057142594==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

--- orig/arch/mips/kernel/irq.c	2005-01-20 20:06:12.000000000 +0530
+++ linux-2.6.11-rc2/arch/mips/kernel/irq.c	2005-01-25 15:29:35.000000000 +0530
@@ -125,7 +125,7 @@ void __init init_IRQ(void)
 		irq_desc[i].action  = NULL;
 		irq_desc[i].depth   = 1;
 		irq_desc[i].handler = &no_irq_type;
-		irq_desc[i].lock = SPIN_LOCK_UNLOCKED;
+		spin_lock_init(&irq_desc[i].lock);
 	}
 
 	arch_init_irq();


--===============72003848057142594==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72003848057142594==--
