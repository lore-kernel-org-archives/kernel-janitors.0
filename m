From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 14 Feb 2007 22:24:16 +0000
Subject: Re: [KJ] [PATCH] Marking obsolete-deprecated stuff
Message-Id: <Pine.LNX.4.64.0702141722330.3434@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1264e020702140722x511bc01ajc6ccbd4eb2816f05@mail.gmail.com>
In-Reply-To: <d1264e020702140722x511bc01ajc6ccbd4eb2816f05@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 14 Feb 2007, Yaman wrote:

> For marking obsolote-deprecated stuff, compiles fine for arm
> architecture. If that's the way to go i can complete the rest.
>
> Signed-off-by: Yaman Cakmakci <yamanc@gmail.com>

are you talking about the patch i proposed that adds code maturity
level options of OBSOLETE and DEPRECATED?  that's still working its
way through the system -- if/when it finally gets applied, it will go
into init/Kconfig, but i'm still waiting.

what exactly did you do that you're talking about here?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
