From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 25 Jan 2005 07:03:08 +0000
Subject: Re: [KJ] [PATCH] unified spinlock initialization
Message-Id: <20050125070308.GB7452@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Randy.Dunlap (rddunlap@osdl.org) wrote:
> Christophe Lucas wrote:
> >In: drivers/misc/ibmasm/module.c
> >
> >Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
> >
> >
> >------------------------------------------------------------------------
> >
> >diff -urbNB linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c 
> >linux-2.6.10/drivers/misc/ibmasm/module.c
> >--- linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c	2005-01-24 
> >17:08:09.000000000 +0100
> >+++ linux-2.6.10/drivers/misc/ibmasm/module.c	2005-01-24 
> >17:18:31.000000000 +0100
> >@@ -107,7 +107,7 @@
> > 		goto error_remote_queue;
> > 	}
> > 
> >-	sp->lock = SPIN_LOCK_UNLOCKED;
> >+	spin_lock_init( &sp->lock );
> 
> Please lose those spaces... that's not kernel coding style.

Hi,

Thanks Randy,
Here is the corrected patch.
In: drivers/misc/ibmasm/module.c

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

Have a good day :)
-- 
Christophe

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="ibmmasm-module-unified-spinlock.patch"

diff -urbNB linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c linux-2.6.10/drivers/misc/ibmasm/module.c
--- linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c	2005-01-24 17:08:09.000000000 +0100
+++ linux-2.6.10/drivers/misc/ibmasm/module.c	2005-01-24 17:18:31.000000000 +0100
@@ -107,7 +107,7 @@
 		goto error_remote_queue;
 	}
 
-	sp->lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&sp->lock);
 	INIT_LIST_HEAD(&sp->command_queue);
 
 	result = request_irq(sp->irq, ibmasm_interrupt_handler, SA_SHIRQ, sp->devname, (void*)sp);

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--7JfCtLOvnd9MIVvH--
