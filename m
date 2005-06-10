From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 10 Jun 2005 21:04:49 +0000
Subject: [KJ] schedule_timeout(1) -- best approach?
Message-Id: <20050610210449.GE2630@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============035020362519999182=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============035020362519999182==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fellow KJ-ers,

Now that CONFIG_HZ has gone into -mm, people are going to start seeing
"bugs" which may be just timing issues (in the sense of inaccurate
requests).

We should have a TODO entry to look into the callers of
schedule_timeout() who use arbitrary numbers instead of HZ-relative
values. The most common case is schedule_timeout(1).

-Nish

--- TODO	2005-06-10 14:00:28.000000000 -0700
+++ TODO-dev	2005-06-10 14:03:29.000000000 -0700
@@ -96,6 +96,13 @@ Remove unneeded historic code / New API 
   them all, because we want to remove sleep_on() and friends in 2.5.
   [D: http://boudicca.tux.org/hypermail/linux-kernel/2001week05/0305.html]
   Be sure to read replies too.
+- Callers of schedule_timeout() who pass in an absolute constant (i.e.
+  with no reference to HZ) may be broken, especially with a variable HZ
+  value. Verify which behavior is intended: if the caller needs the
+  shortest delay possible, then schedule_timeout(1) is correct and a
+  comment can be added; if they actually need a certain amount of time,
+  then use msleep() or schedule_timeout with an appropriate
+  {msecs,usecs,nsecs}_to_jiffies() call.
 - Replace (un)register_ioctl32_conversion with ioctl_compat:
   [D: http://lkml.org/lkml/2005/1/5/106]
 

--===============035020362519999182==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============035020362519999182==--
