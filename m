From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:20:29 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/4] w1/w1: add
Message-Id: <20040927232029.GA1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36329289691238831=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920235909.GG2270@us.ibm.com>
In-Reply-To: <20040920235909.GG2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============36329289691238831==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Inserted set_current_state() before schedule_timeout() so
the task delays as expected. Without the insertion, schedule_timeout()
will return immediately.

--- 2.6.9-rc2-vanilla/drivers/w1/w1.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/w1/w1.c	2004-09-14 10:45:44.000000000 -0700
@@ -446,8 +446,10 @@ static void w1_slave_detach(struct w1_sl
 	
 	dev_info(&sl->dev, "%s: detaching %s.\n", __func__, sl->name);
 
-	while (atomic_read(&sl->refcnt))
+	while (atomic_read(&sl->refcnt)) {
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(10);
+	}
 
 	sysfs_remove_bin_file (&sl->dev.kobj, &sl->attr_bin);
 	device_remove_file(&sl->dev, &sl->attr_name);

--===============36329289691238831==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36329289691238831==--
