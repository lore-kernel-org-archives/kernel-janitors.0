From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 06 Nov 2020 10:23:34 +0000
Subject: Re: [PATCH] taskstats: remove unneeded dead assignment
Message-Id: <alpine.DEB.2.21.2011061113270.20338@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106062210.27920-1-lukas.bulwahn@gmail.com> <20201106095004.GA3269193@ubuntu-m3-large-x86>
In-Reply-To: <20201106095004.GA3269193@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Balbir Singh <bsingharora@gmail.com>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org



On Fri, 6 Nov 2020, Nathan Chancellor wrote:

> On Fri, Nov 06, 2020 at 07:22:10AM +0100, Lukas Bulwahn wrote:
> > make clang-analyzer on x86_64 defconfig caught my attention with:
> > 
> >   kernel/taskstats.c:120:2: warning: Value stored to 'rc' is never read \
> >   [clang-analyzer-deadcode.DeadStores]
> >           rc = 0;
> >           ^
> > 
> > Commit d94a041519f3 ("taskstats: free skb, avoid returns in
> > send_cpu_listeners") made send_cpu_listeners() not return a value and
> > hence, the rc variable remained only to be used within the loop where
> > it is always assigned before read and it does not need any other
> > initialisation.
> > 
> > So, simply remove this unneeded dead initializing assignment.
> > 
> > As compilers will detect this unneeded assignment and optimize this anyway,
> > the resulting object code is identical before and after this change.
> > 
> > No functional change. No change to object code.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Question below.
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> > ---
> > applies cleanly on current master and next-20201105
> > 
> > Balbir, please pick this minor non-urgent clean-up patch.
> > 
> >  kernel/taskstats.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> > index a2802b6ff4bb..bd18a7bf5276 100644
> > --- a/kernel/taskstats.c
> > +++ b/kernel/taskstats.c
> > @@ -117,7 +117,6 @@ static void send_cpu_listeners(struct sk_buff *skb,
> >  
> >  	genlmsg_end(skb, reply);
> >  
> > -	rc = 0;
> >  	down_read(&listeners->sem);
> >  	list_for_each_entry(s, &listeners->list, list) {
> 
> Would it be worth moving the scope of rc into the for loop, now that it
> is only used there? Looks like it used to be used in the main function
> scope before commit 053c095a82cf ("netlink: make nlmsg_end() and
> genlmsg_end() void") but if this is removed, it is only used to check
> the return of genlmsg_unicast within the list_for_each_entry loop. Not
> sure that buys us anything but I know you have done it in patches
> before so I thought it was worth considering.
>

I thought about moving it into the local scope, but it is a purely 
cosmetic matter. Compilers are smart enough to generate the same code no 
matter where it is defined.
So, I always look around in the same file to determine if there is some 
kind of strong preference for very locally scoped variable definition or 
if they are generally just all defined at the function entry.

Depending on my gut feeling in which style the file has mainly been 
written, I then go with the one or other option. In this case, I went 
with just keeping the definition at the function entry.

There is really no strong rule, though, that I see serving as good 
indicator.

Thanks for your review.

Lukas
