From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 10 Jan 2005 20:08:00 +0000
Subject: [KJ] [UPDATE PATCH] drivers/dmapool: use TASK_UNINTERRUPTIBLE
Message-Id: <20050110200800.GA9186@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47658684203179735=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============47658684203179735==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> msleep_interruptible-drivers_base_dmapool.patch

Please replace with the following patch. msleep_interruptible() is not
appropriate for this delay, as the waitqueue events will be missed.
TASK_UNINTERRUPTIBLE should be used instead of TASK_INTERRUPTIBLE, though, as
signals are not checked for.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/base/dmapool.c	2004-12-24 13:35:28.000000000 -0800
+++ 2.6.10/drivers/base/dmapool.c	2005-01-10 12:05:08.000000000 -0800
@@ -293,7 +293,7 @@ restart:
 		if (mem_flags & __GFP_WAIT) {
 			DECLARE_WAITQUEUE (wait, current);
 
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue (&pool->waitq, &wait);
 			spin_unlock_irqrestore (&pool->lock, flags);
 

--===============47658684203179735==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47658684203179735==--
