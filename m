From: Amit Gud <amitg@calsoftinc.com>
Date: Thu, 20 Jan 2005 15:38:18 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <200501202056.19804.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69160029159239955=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============69160029159239955==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


--- vanilla-2.6.10/arch/um/drivers/mconsole_kern.c	2005-01-19 11:19:23.000000000 +0530
+++ linux-2.6.10/arch/um/drivers/mconsole_kern.c	2005-01-20 20:16:58.000000000 +0530
@@ -454,12 +454,14 @@ void mconsole_sysrq(struct mc_request *r
  * active.
  */
 static char *notify_socket = NULL; 
+static spinlock_t notify_spinlock;
 
 int mconsole_init(void)
 {
 	int err, sock;
 	char file[256];
 
+	spin_lock_init(&notify_spinlock);
 	if(umid_file_name("mconsole", file, sizeof(file))) return(-1);
 	snprintf(mconsole_socket_name, sizeof(file), "%s", file);
 
@@ -535,8 +537,6 @@ static int create_proc_mconsole(void)
 	return(0);
 }
 
-static spinlock_t notify_spinlock = SPIN_LOCK_UNLOCKED;
-
 void lock_notify(void)
 {
 	spin_lock(&notify_spinlock);


--===============69160029159239955==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69160029159239955==--
