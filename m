From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:32:19 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/ktti.c
Message-Id: <20050325133219.GO14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="uJWb33pM2TcUAXIl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_ktti.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/ktti.c b/drivers/block/paride/ktti.c
--- a/drivers/block/paride/ktti.c	2005-03-18 02:34:08.000000000 +0100
+++ b/drivers/block/paride/ktti.c	2005-03-22 16:44:45.000000000 +0100
@@ -92,7 +92,7 @@ static void ktti_disconnect ( PIA *pi )
 
 static void ktti_log_adapter( PIA *pi, char * scratch, int verbose )
 
-{       printk("%s: ktti %s, KT adapter at 0x%x, delay %d\n",
+{       printk(KERN_INFO "%s: ktti %s, KT adapter at 0x%x, delay %d\n",
                 pi->device,KTTI_VERSION,pi->port,pi->delay);
 
 }

--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--uJWb33pM2TcUAXIl--
