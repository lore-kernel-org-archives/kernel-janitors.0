From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 18 Oct 2004 10:36:33 +0000
Subject: [KJ] Re: [PATCH 0/8] replacing/fixing printk with pr_debug/pr_info
Message-Id: <20041018103633.GA6792@elte.hu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============033110839154602445=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1098031764.3023.45.camel@pdp11.tsho.org> <20041017161953.GA24810@elte.hu> <1098067288.2892.293.camel@pdp11.tsho.org>
In-Reply-To: <1098067288.2892.293.camel@pdp11.tsho.org>
To: Daniele Pizzoni <auouo@tin.it>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>

--===============033110839154602445==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


* Daniele Pizzoni <auouo@tin.it> wrote:

> On dom, 2004-10-17 at 18:19, Ingo Molnar wrote: 
> > [...]
> > 
> > 1) be careful, there is no inconsistency here. It's a printk that doesnt
> > end in a "\n" in the first line.
> 
> You're right, my fault and a big one!
> 
> Anyway I'm going to ask some questions.

> There's nothing wrong with Dprintk or dprintk. I simply found a
> request to do so on the janitors TODO list. I found out that in
> kernel.h there was really a pr_debug macro and I used it.

ok. 

> The rationale is that in the kernel there are lots of custom dprintk,
> Dprintk, DPRINTK, etc that we need a bit of housekeeping, I think.
> Anyway I didn't like pr_info either (why not a pr_notice...?) but I
> used it: it was in kernel.h I assumed it was for good.

ok - pr_debug() is ok i think for the APIC code. It pairs well with the
other variants: pr_notice(), etc.

> I need a bit of advice now: should I forget about printks' levels,
> consistency and focus on other issues or with a bit of work these
> patches may became worth of?

i'd suggest to first do the Dprintk -> pr_debug replacement patch with
as few output changes as possible. (output changes are unavoidable when
converting a \n-less printout.) Then do any format cleanups in a
separate patch.

(some of your other comments about 'spurious' whitespaces need a
double-check too, sometimes they are done for formatting reasons. So
always take a look at the log output before changing it.)

	Ingo

--===============033110839154602445==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============033110839154602445==--
