From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 02 May 2005 06:26:00 +0000
Subject: [KJ] [PATCH] ppc/fcc_enet: replace schedule_timeout() with ssleep()
Message-Id: <20050502062600.GD10173@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82575349112143215=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050502061446.GB10173@us.ibm.com>
In-Reply-To: <20050502061446.GB10173@us.ibm.com>
To: dmalek@jlc.net
Cc: Kernel-Janitors <kernel-janitors@lists.osdl.org>, linuxppc-embedded@ozlabs.org

--===============82575349112143215==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I couldn't find an appropriate entry in MAINTAINERS for this patch.

Use ssleep() instead of schedule_timeout() to guarantee the task delays
as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.12-rc3/arch/ppc/8260_io/fcc_enet.c	2005-04-29 11:03:03.000000000 -0700
+++ 2.6.12-rc3-dev/arch/ppc/8260_io/fcc_enet.c	2005-05-01 19:10:58.000000000 -0700
@@ -1305,12 +1305,11 @@ static void mii_parse_dm9161_scsr(uint m
 
 static void mii_dm9161_wait(uint mii_reg, struct net_device *dev)
 {
-	int timeout = HZ;
+	int timeout_secs = 1;
 
 	/* Davicom takes a bit to come up after a reset,
 	 * so wait here for a bit */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(timeout);
+	ssleep(timeout_secs);
 }
 
 static phy_info_t phy_info_dm9161 = {

--===============82575349112143215==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82575349112143215==--
