From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 10 Jan 2005 18:23:04 +0000
Subject: [KJ] [UPDATE PATCH] scsi/qla1280: replace schedule_timeout() with
Message-Id: <20050110182304.GF3099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99045542286607624=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============99045542286607624==
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

> msleep-drivers_scsi_ppa.patch

Please drop this patch, as it incorrectly uses msleep() around waitqueues.

> msleep-drivers_scsi_qla1280.patch

Please conside replacing with the following patch:

Description: Use ssleep() instead of schedule_timeout to guarantee the task
delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/scsi/qla1280.c	2004-12-24 13:35:40.000000000 -0800
+++ 2.6.10/drivers/scsi/qla1280.c	2005-01-05 14:23:05.000000000 -0800
@@ -2939,7 +2939,7 @@ qla1280_bus_reset(struct scsi_qla_host *
 		ha->bus_settings[bus].failed_reset_count++;
 	} else {
 		spin_unlock_irq(HOST_LOCK);
-		schedule_timeout(reset_delay * HZ);
+		ssleep(reset_delay);
 		spin_lock_irq(HOST_LOCK);
 
 		ha->bus_settings[bus].scsi_bus_dead = 0;

--===============99045542286607624==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99045542286607624==--
