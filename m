From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 20:30:51 +0000
Subject: [Kernel-janitors] [PATCH 6/8] block/swim3: replace direct
Message-Id: <20040915203051.GB5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98109206194718257=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98109206194718257==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: set_current_state() is used instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/block/swim3.c	2004-09-09 23:05:54.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/block/swim3.c	2004-09-10 10:04:06.000000000 -0700
@@ -832,7 +832,7 @@ static int fd_eject(struct floppy_state 
 			break;
 		}
 		swim3_select(fs, RELAX);
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 		if (swim3_readbit(fs, DISK_IN) == 0)
 			break;
@@ -900,7 +900,7 @@ static int floppy_open(struct inode *ino
 				break;
 			}
 			swim3_select(fs, RELAX);
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule_timeout(1);
 		}
 		if (err == 0 && (swim3_readbit(fs, SEEK_COMPLETE) == 0
@@ -984,7 +984,7 @@ static int floppy_revalidate(struct gend
 		if (signal_pending(current))
 			break;
 		swim3_select(fs, RELAX);
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 	}
 	ret = swim3_readbit(fs, SEEK_COMPLETE) == 0

--===============98109206194718257==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98109206194718257==--
