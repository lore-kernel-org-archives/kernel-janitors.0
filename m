From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:19:05 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/4] w1/w1_family: add
Message-Id: <20040927231905.GY1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============097000560072943554=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221309.GA2270@us.ibm.com>
In-Reply-To: <20040920221309.GA2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============097000560072943554==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Inserted set_current_state() before schedule_timeout() so
the task delays as expected. Without the insertion, schedule_timeout()
will return immediately.

--- 2.6.9-rc2-vanilla/drivers/w1/w1_family.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/w1/w1_family.c	2004-09-14 10:46:00.000000000 -0700
@@ -84,8 +84,10 @@ void w1_unregister_family(struct w1_fami
 
 	spin_unlock(&w1_flock);
 
-	while (atomic_read(&fent->refcnt))
+	while (atomic_read(&fent->refcnt)) {
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(10);
+	}
 }
 
 /*

--===============097000560072943554==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============097000560072943554==--
