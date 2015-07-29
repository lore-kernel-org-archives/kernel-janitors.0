From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jul 2015 21:36:05 +0000
Subject: [patch] [SCSI] atp870u: 64 bit bug in probe()
Message-Id: <20150729213605.GD21784@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130904095002.GC13892@elgon.mountain>
In-Reply-To: <20130904095002.GC13892@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@odin.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 64 bit CPUs there is a memory corruption bug on probe().  It should
be a u32 pointer instead of an unsigned long pointer or we write past
the end of the setupdata[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Someone reported in 2003 that probe has a NULL deref so maybe it's
related to this memory corruption?
https://bugzilla.kernel.org/show_bug.cgi?id18

If only we had applied this patch when I originally sent it two years
ago, then it would only be 10 years too late instead of 12!  :P

diff --git a/drivers/scsi/atp870u.c b/drivers/scsi/atp870u.c
index 05301bc..62acabd 100644
--- a/drivers/scsi/atp870u.c
+++ b/drivers/scsi/atp870u.c
@@ -2791,11 +2791,11 @@ next_fblk_885:
 		    p->global_map[m]= 0;
 		    for (k=0; k < 4; k++) {
 			outw(n++,base_io + 0x3c);
-			((unsigned long *)&setupdata[m][0])[k]=inl(base_io + 0x38);
+			((u32 *)&setupdata[m][0])[k]=inl(base_io + 0x38);
 		    }
 		    for (k=0; k < 4; k++) {
 			outw(n++,base_io + 0x3c);
-			((unsigned long *)&p->sp[m][0])[k]=inl(base_io + 0x38);
+			((u32 *)&p->sp[m][0])[k]=inl(base_io + 0x38);
 		    }
 		    n += 8;
 		}
