From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 23:58:27 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/4] mtd/cfi_cmdset_0001:
Message-Id: <20040920235827.GE2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16439001902599526=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221309.GA2270@us.ibm.com>
In-Reply-To: <20040920221309.GA2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============16439001902599526==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/mtd/chips/cfi_cmdset_0001.c	2004-09-09 23:05:53.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/mtd/chips/cfi_cmdset_0001.c	2004-09-10 14:11:19.000000000 -0700
@@ -1649,7 +1649,7 @@ static int do_xxlock_oneblock(struct map
 		BUG();
 
 	spin_unlock(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */

--===============16439001902599526==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16439001902599526==--
