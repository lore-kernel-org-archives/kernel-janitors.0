From: Daniele Pizzoni <auouo@tin.it>
Date: Mon, 18 Oct 2004 12:09:33 +0000
Subject: [KJ] Re: [PATCH 0/8] replacing/fixing printk with pr_debug/pr_info
Message-Id: <1098104383.3024.44.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94242460140374851=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1098031764.3023.45.camel@pdp11.tsho.org>
	 <20041017161953.GA24810@elte.hu> <1098067288.2892.293.camel@pdp11.tsho.org>
	 <20041018103633.GA6792@elte.hu>
In-Reply-To: <20041018103633.GA6792@elte.hu>
To: Ingo Molnar <mingo@elte.hu>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>

--===============94242460140374851==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On lun, 2004-10-18 at 12:36, Ingo Molnar wrote:
> 
> ok - pr_debug() is ok i think for the APIC code. It pairs well with the
> other variants: pr_notice(), etc.
> [...] 
> i'd suggest to first do the Dprintk -> pr_debug replacement patch with
> as few output changes as possible. (output changes are unavoidable when
> converting a \n-less printout.) Then do any format cleanups in a
> separate patch.

Look, there is no pr_notice at all. The whole thing is not very clear I
think, and the pr_ macros have some problem.

This is the kernel.h part regarding the two and only pr_debug and
pr_info:

#ifdef DEBUG
#define pr_debug(fmt,arg...) \
printk(KERN_DEBUG fmt,##arg)
#else
#define pr_debug(fmt,arg...) \
do { } while (0)
#endif

#define pr_info(fmt,arg...) \
printk(KERN_INFO fmt,##arg)

I think that pr_debug does make sense, because it depends on DEBUG and
is a useful macro uniforming all the DPRINTK usage.

pr_info is alone, there are no other pr_*. I used it in the patches but
now I think I was wrong. You cannot "continue" a pr_info as you do with
printk because it always inserts the loglevel tag. I think it's better
not use it or find a better solution. In fact it is not used too much in
the kernel.

I'll try some strict dprintk -> pr_debug replacements.

Bye
Daniele



--===============94242460140374851==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94242460140374851==--
