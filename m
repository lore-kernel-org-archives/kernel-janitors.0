From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 18:25:22 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/3] macintosh/therm_windtunnel:
Message-Id: <20040917182522.GT1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64318946042149183=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234735.GJ1777@us.ibm.com>
In-Reply-To: <20040916234735.GJ1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============64318946042149183==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/macintosh/therm_windtunnel.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/macintosh/therm_windtunnel.c	2004-09-10 11:51:21.000000000 -0700
@@ -292,8 +292,7 @@ control_loop( void *dummy )
 	while( x.running ) {
 		up( &x.lock );
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout( 8*HZ );
+		msleep_interruptible(8000);
 		
 		down( &x.lock );
 		poll_temp();

--===============64318946042149183==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64318946042149183==--
