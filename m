From: Daniele Pizzoni <auouo@tin.it>
Date: Mon, 18 Oct 2004 01:44:17 +0000
Subject: [KJ] Re: [PATCH 0/8] replacing/fixing printk with pr_debug/pr_info
Message-Id: <1098067288.2892.293.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8256103159142183=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1098031764.3023.45.camel@pdp11.tsho.org>
	 <20041017161953.GA24810@elte.hu>
In-Reply-To: <20041017161953.GA24810@elte.hu>
To: Ingo Molnar <mingo@elte.hu>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>

--===============8256103159142183==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On dom, 2004-10-17 at 18:19, Ingo Molnar wrote: 
> [...]
> 
> 1) be careful, there is no inconsistency here. It's a printk that doesnt
> end in a "\n" in the first line.

You're right, my fault and a big one!

Anyway I'm going to ask some questions.

DEFAULT_MESSAGE_LOGLEVEL in printk.c is the loglevel printks' without
loglevel print to. What's its use? Why should I change the loglevel of
some randomly chosen printks around the kernel only? When should I use
the defaulting printks' in my code? Isn't confusing the fact that the
call

printk("Hello!\n");

behaves differently ("log using the default loglevel" or "continue
logging from before") depending on what's happened before?
Is this a feature, a bug or am a newbie? :)

> 2) i dont like the pr_print name at all. What's wrong with Dprintk or
> dprintk? Just define them in kernel.h, this will also make your patch
> much smaller.

There's nothing wrong with Dprintk or dprintk. I simply found a request
to do so on the janitors TODO list. I found out that in kernel.h there
was really a pr_debug macro and I used it.

The rationale is that in the kernel there are lots of custom dprintk,
Dprintk, DPRINTK, etc that we need a bit of housekeeping, I think.
Anyway I didn't like pr_info either (why not a pr_notice...?) but I used
it: it was in kernel.h I assumed it was for good.

I need a bit of advice now: should I forget about printks' levels,
consistency and focus on other issues or with a bit of work these
patches may became worth of?

Bye and thanks for your replies.

-- 
Daniele Pizzoni <auouo@tin.it>


--===============8256103159142183==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8256103159142183==--
