From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 18:06:00 +0000
Subject: [Kernel-janitors] [PATCH] radio/radio-cadet: replace
Message-Id: <20040726180600.GA1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54333632153235367=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54333632153235367==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-cadet.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/media/radio/radio-cadet.c	2004-07-02 20:30:07.000000000 +0000
@@ -69,8 +69,7 @@ static int cadet_getrds(void)
 	outb(inb(io+1)&0x7f,io+1);  /* Reset RDS detection */
 	spin_unlock(&cadet_io_lock);
 	
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
 
 	spin_lock(&cadet_io_lock);	
         outb(3,io);                 /* Select Decoder Control/Status */
@@ -243,8 +242,7 @@ static void cadet_setfreq(unsigned freq)
 		outb(curvol,io+1);
 		spin_unlock(&cadet_io_lock);
 		
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep(100);
 
 		cadet_gettune();
 		if((tunestat & 0x40) == 0) {   /* Tuned */

--===============54333632153235367==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54333632153235367==--
