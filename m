From: Amit Gud <amit.gud@veritas.com>
Date: Fri, 11 Mar 2005 14:26:26 +0000
Subject: [KJ] [PATCH 1/3] unified spinlock initialization
Message-Id: <4231A7C2.6040808@veritas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050311142252.GA3028@neon>
In-Reply-To: <20050311142252.GA3028@neon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

    Unify the spinlock initialization as far as possible.

    Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

--- ../kernels/linux-2.6.11/include/linux/wait.h        2005-03-10 
12:03:31.000000000 +0530
+++ kj-2.6.11/include/linux/wait.h      2005-03-11 19:29:44.381918880 +0530
@@ -79,7 +79,7 @@ typedef struct __wait_queue_head wait_qu

 static inline void init_waitqueue_head(wait_queue_head_t *q)
 {
-       q->lock = SPIN_LOCK_UNLOCKED;
+       spin_lock_init(&q->lock);
        INIT_LIST_HEAD(&q->task_list);
 }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
