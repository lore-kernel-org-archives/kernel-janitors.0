From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 23:57:47 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/4] mtd/amd_flash: replace
Message-Id: <20040920235747.GD2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43006686101788238=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221217.GZ2270@us.ibm.com>
In-Reply-To: <20040920221217.GZ2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============43006686101788238==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/mtd/chips/amd_flash.c	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/mtd/chips/amd_flash.c	2004-09-15 09:30:31.000000000 -0700
@@ -1122,7 +1122,7 @@ retry:
 	timeo = jiffies + (HZ * 20);
 
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 	
 	while (flash_is_busy(map, adr, private->interleave)) {

--===============43006686101788238==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43006686101788238==--
