From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 10 Jan 2005 21:15:42 +0000
Subject: [KJ] [UPDATE PATCH] block/pf: replace pf_sleep() with msleep()
Message-Id: <20050110211542.GD9186@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92413946674134007=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============92413946674134007==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> msleep_interruptible-drivers_block_pf.patch

Please consider replacing with the following patch:

Description: Use msleep() instead of pf_sleep() to guarantee
the task delays as expected. TASK_INTERRUPTIBLE is used in the original code,
however there is no check on the return values / for signals, thus I believe
TASK_UNINTERRUPTIBLE (and hence msleep()) is more appropriate. Remove the
definition of pf_sleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/block/paride/pf.c	2004-12-24 13:35:01.000000000 -0800
+++ 2.6.10/drivers/block/paride/pf.c	2005-01-10 12:20:20.000000000 -0800
@@ -526,12 +526,6 @@ static void pf_eject(struct pf_unit *pf)
 
 #define PF_RESET_TMO   30	/* in tenths of a second */
 
-static void pf_sleep(int cs)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(cs);
-}
-
 /* the ATAPI standard actually specifies the contents of all 7 registers
    after a reset, but the specification is ambiguous concerning the last
    two bytes, and different drives interpret the standard differently.
@@ -546,11 +540,11 @@ static int pf_reset(struct pf_unit *pf)
 	write_reg(pf, 6, 0xa0+0x10*pf->drive);
 	write_reg(pf, 7, 8);
 
-	pf_sleep(20 * HZ / 1000);
+	msleep(20);
 
 	k = 0;
 	while ((k++ < PF_RESET_TMO) && (status_reg(pf) & STAT_BUSY))
-		pf_sleep(HZ / 10);
+		msleep(100);
 
 	flg = 1;
 	for (i = 0; i < 5; i++)

--===============92413946674134007==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92413946674134007==--
