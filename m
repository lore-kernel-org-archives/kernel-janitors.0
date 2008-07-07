From: ravikumar <ravikumar.vallabhu@gmail.com>
Date: Mon, 07 Jul 2008 04:45:26 +0000
Subject: mixing interupts and threads.
Message-Id: <48719C96.6010503@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello All ,
I've a few questions.
1. Lets suppose i've some critical section and it is synchronized with 
locks. A thread came and  it's  execution  is in the middle of critical 
section, at this time an interrupt was occurred which  also executes 
critical section. As interrupts can't wait on any lock it will get lock 
and try to execute the critical section and above thread was not yet 
completed. So inconsistency . How this was handled in Linux.
2.Some process is running in kernel mode, at this a kill was sent to 
this process, does this signal will delivered to the process while it is 
in kernel mode.

And also please provide some links  how threads ,signals and interrupts 
will be mixed.

Regards,
Ravikumar.
