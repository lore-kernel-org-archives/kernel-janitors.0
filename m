From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:20:01 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/4] w1/w1_int: add
Message-Id: <20040927232001.GZ1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25947356707937175=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920235847.GF2270@us.ibm.com>
In-Reply-To: <20040920235847.GF2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============25947356707937175==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Inserted set_current_state() before schedule_timeout() so
the task delays as expected. Without the insertion, schedule_timeout()
will return immediately.

--- 2.6.9-rc2-vanilla/drivers/w1/w1_int.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/w1/w1_int.c	2004-09-14 10:46:18.000000000 -0700
@@ -179,8 +179,10 @@ void __w1_remove_master_device(struct w1
 			 "%s: Failed to send signal to w1 kernel thread %d.\n",
 			 __func__, dev->kpid);
 
-	while (atomic_read(&dev->refcnt))
+	while (atomic_read(&dev->refcnt)) {
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(10);
+	}
 
 	msg.id.mst.id = dev->id;
 	msg.id.mst.pid = dev->kpid;

--===============25947356707937175==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25947356707937175==--
