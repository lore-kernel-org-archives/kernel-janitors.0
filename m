From: Amit Gud <amitg@calsoftinc.com>
Date: Thu, 20 Jan 2005 15:39:15 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <200501202057.16728.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10313167594386718=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============10313167594386718==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


--- vanilla-2.6.10/arch/um/drivers/port_kern.c	2005-01-19 11:19:23.000000000 +0530
+++ linux-2.6.10/arch/um/drivers/port_kern.c	2005-01-20 20:18:37.000000000 +0530
@@ -185,11 +185,11 @@ void *port_data(int port_num)
 		  .has_connection 	= 0,
 		  .sem 			= __SEMAPHORE_INITIALIZER(port->sem, 
 								  0),
-		  .lock 		= SPIN_LOCK_UNLOCKED,
 		  .port 	 	= port_num,
 		  .fd  			= fd,
 		  .pending 		= LIST_HEAD_INIT(port->pending),
 		  .connections 		= LIST_HEAD_INIT(port->connections) });
+	spin_lock_init(&port->lock);
 	list_add(&port->list, &ports);
 
  found:


--===============10313167594386718==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10313167594386718==--
