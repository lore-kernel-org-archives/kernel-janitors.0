From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 04 Mar 2005 00:25:39 +0000
Subject: [KJ] [UPDATE PATCH] cdrom/mcdx: fix wait-queue compile-time breakage
Message-Id: <20050304002539.GE16078@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78459361091138513=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============78459361091138513==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2005 at 10:57:10AM +0100, Domen Puncer wrote:
> A new release from kernel janitors (http://janitor.kernelnewbies.org/).
> 
> Apologies to janitors that this took so long.
> This time we have a new record: 354 patches!
> I'll start sending/resending what's not already in -mm soon.
> 
> Patchset is at http://coderock.org/kj/2.6.11-kj/

<snip>

> int_sleep_on-drivers_cdrom_mcdx.patch
>   From: Nishanth Aravamudan <nacc@us.ibm.com>
>   Subject: [KJ] [PATCH 16/20] cdrom/mcdx: remove 	interruptible_sleep_on_timeout() usage

Description: The original patch leads to compile-warnings from older
version of GCC and violates CodingStyle. Moving the declaration to the
head of the function fixes it.

--- 2.6.11-kj-v/drivers/cdrom/mcdx.c	2005-03-02 11:21:41.000000000 -0800
+++ 2.6.11-kj/drivers/cdrom/mcdx.c	2005-03-03 10:30:32.000000000 -0800
@@ -838,10 +838,10 @@ static void mcdx_delay(struct s_drive_st
  *	May be we could use a simple count loop w/ jumps to itself, but
  *	I wanna make this independent of cpu speed. [1 jiffy is 1/HZ] sec */
 {
+	DEFINE_WAIT(wait);
 	if (jifs < 0)
 		return;
 
-	DEFINE_WAIT(wait);
 	xtrace(SLEEP, "*** delay: sleepq\n");
 	prepare_to_wait(&stuff->sleepq, &wait, TASK_INTERRUPTIBLE);
 	schedule_timeout(jifs);

--===============78459361091138513==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78459361091138513==--
