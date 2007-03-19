From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 19 Mar 2007 18:00:53 +0000
Subject: [KJ] do all schedule_timeout() calls need to set state first?
Message-Id: <Pine.LNX.4.64.0703191358530.13393@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  based on what i've been reading, all calls to schedule_timeout()
*must* first set the current process state to either
TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE, is that correct?

  since i was once again perusing the source tree and noticed the
following in drivers/hwmon/ams/ams-i2c.c (line 93):

        while (remaining) {
                result = ams_i2c_read(AMS_COMMAND);
                if (result = 0 || result & 0x80)
                        return 0;

                remaining = schedule_timeout(remaining);
        }

it certainly *seems* that the state isn't being set here.  is that an
error?  just curious.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
