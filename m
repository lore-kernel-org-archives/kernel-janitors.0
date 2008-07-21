From: Julia Lawall <julia@diku.dk>
Date: Mon, 21 Jul 2008 07:58:30 +0000
Subject: [PATCH 5/7] drivers/scsi/scsi_scan.c: Release mutex in error handling
Message-Id: <Pine.LNX.4.64.0807210958120.24625@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The mutex is released on a successful return, so it would seem that it
should be released on an error return as well.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression l;
@@

mutex_lock(l);
... when != mutex_unlock(l)
    when any
    when strict
(
if (...) { ... when != mutex_unlock(l)
+   mutex_unlock(l);
    return ...;
}
|
mutex_unlock(l);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -1760,6 +1760,7 @@ static void scsi_finish_async_scan(struc
 		printk("%s called twice for host %d", __FUNCTION__,
 				shost->host_no);
 		dump_stack();
+		mutex_unlock(&shost->scan_mutex);
 		return;
 	}
 
