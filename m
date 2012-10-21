From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 21 Oct 2012 14:24:48 +0000
Subject: Re: [tip:numa/core 10/10] mm/memory.c:3543 do_prot_none() error: double unlock 'spin_lock:ptl'
Message-Id: <20121021142448.GD32592@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121021134517.GB23820@gmail.com>
In-Reply-To: <20121021134517.GB23820@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 21, 2012 at 03:45:17PM +0200, Ingo Molnar wrote:
> 
> * Fengguang Wu <fengguang.wu@intel.com> wrote:
> 
> > Hi Ingo,
> > 
> > FYI, there are new smatch warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git numa/core
> > head:   eb4f84b1aaad78ca07e274b81410ec9d60abe434
> > commit: eb4f84b1aaad78ca07e274b81410ec9d60abe434 [10/10] numa, mm: Fix 4K migration races
> > 
> >   mm/memory.c:805 vm_normal_page() info: ignoring unreachable code.
> >   mm/memory.c:805 vm_normal_page() info: ignoring unreachable code.
> >   mm/memory.c:984 copy_pte_range() warn: inconsistent returns spin_lock:dst_ptl: locked (940) unlocked (979,984)
> >   mm/memory.c:984 copy_pte_range() warn: inconsistent returns spin_lock:__ptl: locked (979,984) unlocked (940)
> >   mm/memory.c:1532 follow_page() info: ignoring unreachable code.
> >   mm/memory.c:1651 follow_page() warn: inconsistent returns spin_lock:ptl: locked (1628,1650,1651) unlocked (1632,1637)
> >   mm/memory.c:1651 follow_page() warn: inconsistent returns spin_lock:__ptl: locked (1632,1637) unlocked (1628,1650,1651)
> >   mm/memory.c:2688 do_wp_page() error: double unlock 'spin_lock:ptl'
> >   mm/memory.c:2733 do_wp_page() error: double unlock 'spin_lock:ptl'
> >   mm/memory.c:2761 do_wp_page() error: double lock 'spin_lock:__ptl'
> >   mm/memory.c:2823 do_wp_page() error: double unlock 'spin_lock:ptl'
> >   mm/memory.c:2853 do_wp_page() warn: inconsistent returns spin_lock:__ptl: locked (2838) unlocked (2692,2725,2849,2853)
> > + mm/memory.c:3543 do_prot_none() error: double unlock 'spin_lock:ptl'
> > + mm/memory.c:3557 do_prot_none() error: double lock 'spin_lock:__ptl'
> >   mm/memory.c:3632 handle_pte_fault() warn: inconsistent returns spin_lock:ptl: locked (3613) unlocked (3591,3594,3598,3600,3605,3632)
> 
> Hm, looks like smatch got confused by the 'locked' variable?
> 
> Or can you see real problems in the code?

Sorry, it's actually an automated notification and I've not yet looked
at the code.. I'll fix the build notification script.

Hi Dan, it looks better to only automate the 100% accurate warnings
and deliver the others to internal manual check first. Would you
recommend some known accurate smatch warnings? It seems to me that
the "redundant null check" notes shall be always accurate. For the
others, I'm not really sure.

Thanks,
Fengguang
