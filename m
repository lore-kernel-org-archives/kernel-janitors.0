From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 20 May 2004 20:41:11 +0000
Subject: Re: [Kernel-janitors] [PATCH] yield() replaced with
Message-Id: <20040520134111.1423b036.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72030995369079265=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
In-Reply-To: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
To: kernel-janitors@vger.kernel.org

--===============72030995369079265==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 May 2004 11:50:22 -0400 (EDT) Brendan Burns wrote:

| Hey folks,
| sorry about the last empty message...  I'm still figuring out this whole
| "e-mail" thing ;-P
| 
| Attached is a patch that replaces all instances of yield() in the drivers
| section of the kernel.   I think my choices of schedule vs
| schedule_timeout make sense.  I'd love someone to check them...  Plus
| since I don't have all the appropriate hardware (read macintosh adb) it
| would be great if they were tested by those who do!


The 2-character indents are not in line with Linux coding style.


Can you explain why some changes use
	schedule_timeout(1);
some use
	schedule_timeout(10);
some use
	schedule_timeout(5*HZ);
some just use
	schedule();

They could all be correct, I'm just curious about the
differences.


+	long time=jiffies;
+	while (time-jiffies < HZ) {
+	  set_current_state(TASK_INTERRUPTIBLE);
+	  schedule_timeout((time+HZ)-jiffies);
use more spaces, they improve readability.  e.g.:
	long time = jiffies;
	while (time - jiffies < HZ) {
	  set_current_state(TASK_INTERRUPTIBLE);
	  schedule_timeout((time + HZ) - jiffies);


For some of these, a new function that was just added might be
the appropriate kernel API to use.  Look at msleep() [merged
2004-may-18] to see if it can be used.  It's in include/linux/delay.h
in a kernel bk pull or bk patch and will be in 2.6.7.

--
~Randy

--===============72030995369079265==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72030995369079265==--
