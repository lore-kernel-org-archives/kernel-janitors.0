From: Gustavo Franco <stratus@acm.org>
Date: Mon, 03 May 2004 01:10:36 +0000
Subject: [Kernel-janitors] [REDIFF] Replaces yield() with schedule_timeout()
Message-Id: <40959C0C.5000706@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1950236912358827=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40904739.9060501@acm.org>
In-Reply-To: <40904739.9060501@acm.org>
To: kernel-janitors@vger.kernel.org

--===============1950236912358827==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

It's the third REDIFF, the last is coming...


Hope that helps,
Gustavo Franco

--- drivers/scsi/megaraid.c.orig    2004-04-28 20:46:06.000000000 -0300
+++ drivers/scsi/megaraid.c     2004-04-28 20:47:18.000000000 -0300
@@ -1691,7 +1691,8 @@
         for (counter = 0; counter < 10000; counter++) {
                 if (!mbox->m_in.busy)
                         return 0;
-               udelay(100); yield(1);
+               set_current_state(TASK_INTERRUPTIBLE);
+               schedule_timeout(1);
         }
         return -1;              /* give up after 1 second */
  }


--===============1950236912358827==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1950236912358827==--
