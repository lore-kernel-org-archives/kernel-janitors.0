From: Cripps <acripps@gmail.com>
Date: Wed, 16 May 2007 15:44:06 +0000
Subject: Re: [KJ] pm_send_all() deprecation
Message-Id: <c6711b6b0705160856h1690030au1ba1d811c8d94c68@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
In-Reply-To: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

so is apm support being completely removed then? Because there are
still calls in arch/i386/kernel/apm.c ... although, I was mistaken in
my first post about the number of calls, I found a total of 14 calls
to the function using grep -r on the kernel source tree root. I know
(now) that pm_send_all() is not only deprecated, but obsolete (as seen
in Documentation/pm.txt) ... it's being called in suspend() in apm.c,
but there it seems more like it's being called as a condition:

if(pm_send_all(PM_SUSPEND, (void *)3)){
             if(vetoeable){... /*veto the damn thing*/ ...}
             else{
                 ...
                /*it's not vetoeable, so we're going to suspend anyways*/
                ...
             }
}

should that just be changed to:
 if(1){
    if(vetoeable){
       ....
     }
    ...

}
or just remove the outer if() statement?

I know, legacy pm is a PITA to work with, but I guess the question I
have is: are we sticking with apm support, or are we moving towards
apm-emulation?

-Aaron Cripps

(sorry for the repeat rday, I forgot to CC the list the first time).

On 5/16/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Tue, 15 May 2007, Cripps wrote:
>
> > Hey,
> > I've found the warning about pm_send_all() being marked for
> > deprecation ... it appears as though
> > this call is only used in arch/i386/kernel/apm.c and is declared in
> > include/pm_legacy.h as:
> > #ifdef CONFIG_PM_LEGACY
> > ...
> > int __deprecated pm_send_all(pm_request_t, void* data);
> > #else
> > ...
> > static inline int pm_send_all(pm_request_t rqst, void* data){ return 0;}
> > ...
> > #endif
> >
> >
> > I wanted to tackle this as a first time patch, but there is one thing
> > I'm not entirely clear on:
> > How do I find out what this is to be replaced with (if there is
> > another function to replace it with), and if it's not meant to be
> > replaced, how would that be handled?
>
> i wouldn't do anything with the legacy PM stuff.  i was working on
> that a while back, and it's in the process of being removed entirely,
> so there's no point trying to clean it up.
>
> rday
> --
> ====================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://fsdev.net/wiki/index.php?title=Main_Page
> ====================================
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
