From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Tue, 21 Feb 2006 07:50:36 +0000
Subject: Re: [KJ][Patch] remove second masking instance of variable in
Message-Id: <1140508237.7780.2.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62042543334515443=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139492214.17930.41.camel@localhost.localdomain>
In-Reply-To: <1139492214.17930.41.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============62042543334515443==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-02-21 at 01:00 +0300, Alexey Dobriyan wrote:

> It's not a pointer, so ending it with "ptr" is not good.
> 

Fair point.
Here is a revised patch.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/atm/firestream.c.orig	2006-02-21 18:30:05.000000000 +1100
+++ linux-2.6.16-rc3/drivers/atm/firestream.c	2006-02-21 18:32:04.000000000 +1100
@@ -615,11 +615,11 @@ static void submit_qentry (struct fs_dev
 		static int c;
 		if (!(c++ % 100))
 			{
-				int rp, wp;
+				int rp, w;
 				rp =  read_fs (dev, Q_RP(q->offset));
-				wp =  read_fs (dev, Q_WP(q->offset));
+				w =  read_fs (dev, Q_WP(q->offset));
 				fs_dprintk (FS_DEBUG_TXQ, "q at %d: %x-%x: %x entries.\n", 
-					    q->offset, rp, wp, wp-rp);
+					    q->offset, rp, w, w-rp);
 			}
 	}
 }
 


--===============62042543334515443==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62042543334515443==--
