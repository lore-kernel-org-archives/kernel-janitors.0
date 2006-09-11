From: Hil <ubuntu@comcast.net>
Date: Mon, 11 Sep 2006 21:52:18 +0000
Subject: fix yield
Message-Id: <1158011538.9376.4.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I am interested in fixing the yield() at
http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m7395278319388&w=2
Has this task been assigned? I will take over if no one has done it. I
just got kernel 2.6.18.rc6 and still found yield under drivers. Please
give me some hints of how to fix the yield. When do I replace yield()
with cond_resched(), schedule() or even schedule_timeout()? I will look
into these functions.

Hil


-------------------------------------------------------------------------
Using Tomcat but need to do more? Need to support web services, security?
Get stuff done quickly with pre-integrated technology to make your job easier
Download IBM WebSphere Application Server v.1.0.1 based on Apache Geronimo
http://sel.as-us.falkag.net/sel?cmd=lnk&kid0709&bid&3057&dat1642
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
