From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:37:15 +0000
Subject: [Kernel-janitors] [PATCH] eicon/io: replace schedule_timeout() with
Message-Id: <20040723173715.GB1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93889552185183311=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93889552185183311==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep() in all instances. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/io.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/io.c	2004-07-02 18:04:27.000000000 +0000
@@ -504,7 +504,7 @@ pcm_req (PISDN_ADAPTER IoAdapter, ENTITY
                "data_pcm_1");
   for ( rc = 0, i = (IoAdapter->trapped ? 3000 : 250) ; !rc && (i > 0) ; --i )
   {
-   diva_os_sleep (1) ;
+   msleep (1) ;
    if (IoAdapter->pcm_pending == 3) {
     diva_os_enter_spin_lock (&IoAdapter->data_spin_lock,
                  &OldIrql,
@@ -542,7 +542,7 @@ pcm_req (PISDN_ADAPTER IoAdapter, ENTITY
  a->ram_out (a, &IoAdapter->pcm->req, pcm->req) ;
  for ( i = (IoAdapter->trapped ? 3000 : 250) ; --i > 0 ; )
  {
-  diva_os_sleep (1) ;
+  msleep (1) ;
   rc = (int)(a->ram_in (a, &IoAdapter->pcm->rc)) ;
   if ( rc )
   {

--===============93889552185183311==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93889552185183311==--
