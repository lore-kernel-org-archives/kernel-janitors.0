From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 13 Jul 2004 16:32:40 +0000
Subject: [Kernel-janitors] amb_talk() (msleep)
Message-Id: <40F40EA8.9080106@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

In continuing to replace, where appropriate, code with msleep() calls, I 
ran across drivers/atm/ambassador.c::amb_talk():

<snip>
  // 2.2 second wait (must not touch doorbell during 2 second DMA test)
  timeout = HZ*22/10;
  while (timeout)
    timeout = schedule_timeout (timeout);
  // give the adapter another half second?
  timeout = HZ/2;
<snip>

There is no call to set_current_state() before these timeouts are 
scheduled and thus they will return immediately. If someone could tell 
me which state (TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE) is desired, 
I can fix this and perhaps replace the calls with msleep().

Thanks,
Nish
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
