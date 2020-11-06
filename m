From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 06 Nov 2020 12:38:18 +0000
Subject: Re: [linux-safety] [PATCH] taskstats: remove unneeded dead assignment
Message-Id: <alpine.DEB.2.21.2011061331250.20338@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106062210.27920-1-lukas.bulwahn@gmail.com> <6ab2415b-0642-16ee-4be0-c909e07e7565@codethink.co.uk> <alpine.DEB.2.21.2011061126130.20338@felia> <aea9d12d-88ee-f262-4328-03993521668f@codethink.co.uk>
In-Reply-To: <aea9d12d-88ee-f262-4328-03993521668f@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Balbir Singh <bsingharora@gmail.com>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org



On Fri, 6 Nov 2020, Sudip Mukherjee wrote:

> Hi Lukas,
> 
> On 06/11/2020 10:31, Lukas Bulwahn wrote:
> > 
> > 
> > On Fri, 6 Nov 2020, Sudip Mukherjee wrote:
> > 
> >> Hi Lukas,
> >>
> 
> <snip>
> 
> > 
> > I did not try but I bet (a beverage of your choice) that the object code
> > remains the same also for your suggested patch. Try to disprove my claim 
> > and possibly earn yourself a beverage when we meet...
> 
> Lets decide which beverage.. ;-)
> 
> Using gcc-7.2.0 for MIPS:
> 
> original:- ab81d3305d578c2568fbc73aad2f9e61  kernel/taskstats.o
> After your change:- ab81d3305d578c2568fbc73aad2f9e61  kernel/taskstats.o
> After my change:- 0acae2c8d72abd3e15bf805fccdca711  kernel/taskstats.o
> 
>

Interesting, can you share the diff of the objdump before and after?

I bet it found now a different assignment from variables to registers or 
so; with the beverage at hand, we can then discuss if that is effectively 
still the same object code or not.

Thanks for confirming that my patch here really remains the same compared 
to before, even on MIPS :) I only checked x86-64...

Lukas 

> 
> -- 
> Regards
> Sudip
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#148): https://lists.elisa.tech/g/linux-safety/message/148
> Mute This Topic: https://lists.elisa.tech/mt/78069241/1714638
> Group Owner: linux-safety+owner@lists.elisa.tech
> Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [lukas.bulwahn@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 
> 
