From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 24 Jan 2005 15:30:23 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <200501242048.26303.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============08120563673400838=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============08120563673400838==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


--- vanilla-2.6.10/drivers/block/cciss_scsi.c	2005-01-19 11:19:25.000000000 +0530
+++ linux-2.6.10/drivers/block/cciss_scsi.c	2005-01-24 19:33:24.000000000 +0530
@@ -534,7 +534,7 @@ cciss_scsi_setup(int cntl_num)
 	if (shba == NULL)
 		return;
 	shba->scsi_host = NULL;
-	shba->lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&shba->lock);
 	shba->registered = 0;
 	if (scsi_cmd_stack_setup(cntl_num, shba) != 0) {
 		kfree(shba);


--===============08120563673400838==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============08120563673400838==--
