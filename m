From: Amit Gud <amitg@calsoftinc.com>
Date: Tue, 25 Jan 2005 11:47:53 +0000
Subject: [KJ] [PATCH] Unified spinlock initialization include/linux/wait.h
Message-Id: <200501251705.58234.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80107375291086846=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, gud@eth.net

--===============80107375291086846==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

--- orig/include/linux/wait.h	2005-01-20 20:06:42.000000000 +0530
+++ linux-2.6.11-rc2/include/linux/wait.h	2005-01-25 16:41:31.000000000 +0530
@@ -79,7 +79,7 @@ typedef struct __wait_queue_head wait_qu
 
 static inline void init_waitqueue_head(wait_queue_head_t *q)
 {
-	q->lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&q->lock);
 	INIT_LIST_HEAD(&q->task_list);
 }
 


--===============80107375291086846==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80107375291086846==--
