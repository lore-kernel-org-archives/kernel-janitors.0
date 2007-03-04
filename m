From: "Badai Aqrandista" <badaiaqrandista@gmail.com>
Date: Sun, 04 Mar 2007 12:19:51 +0000
Subject: Re: [KJ] What does (P) in /proc/modules mean?
Message-Id: <4b4be04a0703040419x42c1197eu921b0fb526eb38cc@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
In-Reply-To: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On 3/4/07, Randy Dunlap <rdunlap@xenotime.net> wrote:
> I just tested this module on 2.6.20, no license issues/problems
> at all.  So what kernel version were you using and what other
> modules were loaded or had been loaded?

I think I found the cause. It's the Makefile. I copied the Makefile
from ldd3 and it includes this line:

CFLAGS += $(DEBFLAGS) -I$(LDDINCDIR)

When I removed -I$(LDDINCDIR) from that line and recompiled the
module, the (P) mark is gone and all printk's are printed to the log.
And $(LDDINCDIR) variable is empty because I didn't pass it.

So I think I can reduce the problem to: passing an empty -I parameter
to CFLAGS makes the module proprietory.

Why is that?

Anyway, thanks for replying so quickly.

-- 
Thanks,
Badai Aqrandista (cheepy)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
