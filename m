From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 10 Jan 2005 18:04:17 +0000
Subject: Re: [KJ] [announce] 2.6.10-bk13-kj
Message-Id: <20050110180417.GC3099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69831661308040283=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============69831661308040283==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> all patches:
> ------------

<snip>

> msleep-drivers_scsi_ide-scsi.patch

Please consider replacing with the following patch (just a minor change):

Description:  Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected. Remove set_current_state() as it is taken care of by
msleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/scsi/ide-scsi.c	2004-12-24 13:35:01.000000000 -0800
+++ 2.6.10/drivers/scsi/ide-scsi.c	2005-01-05 14:23:05.000000000 -0800
@@ -46,6 +46,7 @@
 #include <linux/slab.h>
 #include <linux/ide.h>
 #include <linux/scatterlist.h>
+#include <linux/delay.h>
 
 #include <asm/io.h>
 #include <asm/bitops.h>
@@ -1004,9 +1005,8 @@ static int idescsi_eh_reset (struct scsi
 	/* ide_do_reset starts a polling handler which restarts itself every 50ms until the reset finishes */
 
 	do {
-		set_current_state(TASK_UNINTERRUPTIBLE);
 		spin_unlock_irq(cmd->device->host->host_lock);
-		schedule_timeout(HZ/20);
+		msleep(50);
 		spin_lock_irq(cmd->device->host->host_lock);
 	} while ( HWGROUP(drive)->handler );
 


--===============69831661308040283==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69831661308040283==--
