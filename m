From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 11 Jan 2005 01:00:45 +0000
Subject: [KJ] [UPDATE PATCH] scsi/st: replace schedule_timeout() with
Message-Id: <20050111010045.GM9186@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92032304398045672=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============92032304398045672==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> msleep_interruptible-drivers_scsi_st.patch

Please consider updating to the following patch:

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/scsi/st.c	2004-12-24 13:35:01.000000000 -0800
+++ 2.6.10/drivers/scsi/st.c	2005-01-05 14:23:05.000000000 -0800
@@ -36,6 +36,7 @@ static char *verstr = "20041025";
 #include <linux/moduleparam.h>
 #include <linux/devfs_fs_kernel.h>
 #include <linux/cdev.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 #include <asm/dma.h>
 #include <asm/system.h>
@@ -760,9 +761,7 @@ static int test_ready(struct scsi_tape *
 
 			if (scode == NOT_READY) {
 				if (waits < max_wait) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(HZ);
-					if (signal_pending(current)) {
+					if (msleep_interruptible(1000)) {
 						retval = (-EINTR);
 						break;
 					}

--===============92032304398045672==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92032304398045672==--
