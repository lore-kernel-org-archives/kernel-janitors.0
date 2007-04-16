From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Mon, 16 Apr 2007 18:07:51 +0000
Subject: [KJ] use mutex instead of a binary semaphore
Message-Id: <20070416175551.GB9314@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@lists.osdl.org>
Cc: Kernel Newbies <kernelnewbies@nl.linux.org>, LKML <linux-kernel@vger.kernel.org>


	As the new mutex primitive is now in place, I read,it is advised 
not to use binary semaphore for mutual exclusion.

while looking at different place where a binary semaphore is initialized,
I came accross bd_mount_sem.

I read a thread on LKML few months back related to the bd_mount_sem 
and realized that there are cases where a binary semaphore  can not be replaced by a mutex.
The reason being mutex has a sense of ownership, i.e. 
a mutex can only be unlocked from the context
 from which it was locked.

e.g bd_mount_sem in the block device structure is 
used to make sure no new mounts happen on bdev
 in between freeze_bdev and thaw_bdev().

so locking is done in freeze_bdev &
 unlocking in thaw_bdev these can be from different context i guess..

is my understandig correct..
CMIIW..
would appreciate some pointers on how to identify such cases.. 


-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
