From: Yoann Padioleau <padator@wanadoo.fr>
Date: Tue, 22 May 2007 08:24:30 +0000
Subject: [KJ] question on double cast
Message-Id: <87y7jh4669.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi, 

In drivers/infiniband/hw/amso1100/c2_cm.c", line 321
there is

 	wr->ep_handle = (u32) (unsigned long) cm_id->provider_data;

What is the goal of this double cast ? There are plenty of
such double cast in the kernel.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
