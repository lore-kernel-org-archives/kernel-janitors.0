From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:34:51 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <20050303183451.GI11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17563835029339447=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============17563835029339447==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 09:16:19PM +0200, Alexey Dobriyan wrote:
> On Thursday 03 March 2005 19:43, Nishanth Aravamudan wrote:
> > On Thu, Mar 03, 2005 at 06:41:19PM +0200, Alexey Dobriyan wrote:
> > > On Wednesday 02 March 2005 11:57, Domen Puncer wrote:
> > > 
> > > > int_sleep_on-drivers_cdrom_mcdx.patch
> > > >   From: Nishanth Aravamudan <nacc@us.ibm.com>
> > > >   Subject: [KJ] [PATCH 16/20] cdrom/mcdx: remove 	interruptible_sleep_on_timeout() usage
> > > 
> > > drivers/cdrom/mcdx.c:844:2: warning: mixing declarations and code
> > > drivers/cdrom/mcdx.c: In function `mcdx_delay':
> > > drivers/cdrom/mcdx.c:844: warning: ISO C90 forbids mixed declarations and code
> > 
> > I do not see these compile-time warnings.
> 
> Just use gcc 2.95.3. Nice compile error.

Fair enough, here's a patch which should fix it. Please let me know if
it works and I'll push to LKML over the current KJ set. In this case,
seems like 2.95.3's behavior is weird (I'm not arguing against the need
to patch), as wait ends up being thrown away immediately if jifs<0. Oh
well :)

Description: The declaration of wait was inadvertently placed in the
code when it should have been at the head of the function.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

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

--===============17563835029339447==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17563835029339447==--
