From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 01 Jul 2004 21:10:37 +0000
Subject: [Kernel-janitors] msleep() and delay function (DVB)
Message-Id: <40E47DCD.1000902@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80383642703945113=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80383642703945113==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

[Not subscribed to linux-dvb, so please CC back if replying from that list]

Hi,

I'm working on one of the KernelJanitor/TODO items, specifically 
converting appropriate calls to schedule_timeout() to msleep() calls 
(Addendum by Greg KH to original request by Matthew Wilcox (Calling 
yield() Considered Harmful)). In the process, I have run across the 
following code [dvb_functions.h::dvb_delay()]:

/**
  *  a sleeping delay function, waits i ms
  *
  */
static inline
void dvb_delay(int i)
{
         current->state=TASK_INTERRUPTIBLE;
         schedule_timeout((HZ*i)/1000);
}

Compare this to

/**
  * msleep - sleep safely even with waitqueue interruptions
  * @msecs: Time in milliseconds to sleep for
  */
void msleep(unsigned int msecs)
{
         unsigned long timeout = msecs_to_jiffies(msecs);

         while (timeout) {
                 set_current_state(TASK_UNINTERRUPTIBLE);
                 timeout = schedule_timeout(timeout);
         }
}

I am wondering if dvb_delay() needs to run in TASK_INTERRUPTIBLE (it's 
not the only such case I am seeing right now, but it was the first - if 
anyone would like me to send the other cases, I'd be happy to). 
Obviously, if not, then it can be replaced with msleep() calls. If it 
must, then it probably should be updated to use set_current_state() and 
msecs_to_jiffies() like msleep() does.

This is my first try at Janitor-work, so please be patient.

Thanks,
Nish

--===============80383642703945113==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80383642703945113==--
