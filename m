From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 07 Jan 2005 21:34:00 +0000
Subject: [KJ] [UPDATE PATCH] ieee1394/sbp2: use ssleep() instead of
Message-Id: <20050107213400.GD2924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36955264185761472=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041225004846.GA19373@nd47.coderock.org>
In-Reply-To: <20041225004846.GA19373@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>
Cc: bcollins@debian.org, linux1394-devel@lists.sourceforge.net

--===============36955264185761472==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 25, 2004 at 01:48:46AM +0100, Domen Puncer wrote:
> Hi.
> 
> Santa brought another present :-)
> 
> I'll start mailing new patches these days, and after external trees get
> merged, I'll be bugging you with the old ones.
> 
> 
> Patchset is at http://coderock.org/kj/2.6.10-kj/

<snip>

> all patches:
> ------------

<snip>

> msleep-drivers_ieee1394_sbp2.patch

Please consider updating to the following patch:

Description: Use ssleep() instead of schedule_timeout() to guarantee the task
delays as expected. The existing code should not really need to run in
TASK_INTERRUPTIBLE, as there is no check for signals (or even an early return
value whatsoever). ssleep() takes care of these issues.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.10-v/drivers/ieee1394/sbp2.c	2004-12-24 13:34:00.000000000 -0800
+++ 2.6.10/drivers/ieee1394/sbp2.c	2005-01-05 14:23:05.000000000 -0800
@@ -902,8 +902,7 @@ alloc_fail:
 	 * connected to the sbp2 device being removed. That host would
 	 * have a certain amount of time to relogin before the sbp2 device
 	 * allows someone else to login instead. One second makes sense. */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	ssleep(1);
 
 	/*
 	 * Login to the sbp-2 device

--===============36955264185761472==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36955264185761472==--
