From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 24 May 2007 21:03:40 +0000
Subject: Re: [KJ] Anybody is working on this todo ?
Message-Id: <20070524140340.4b43ccba.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
In-Reply-To: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 24 May 2007 21:54:56 +0200 Richard Knutsson wrote:

> Randy Dunlap wrote:
> > On Thu, 24 May 2007 20:48:28 +0200 Richard Knutsson wrote:
> >
> >   
> >> Randy Dunlap wrote:
> >>     
> >>> On Thu, 24 May 2007 19:55:02 +0200 Richard Knutsson wrote:
> >>>
> >>>   
> >>>       
> >>>> linux newbie wrote:
> >>>>     
> >>>>         
> >>>>> - convert from pci_module_init to pci_register_driver
> >>>>>
> >>>>>       
> >>>>>           
> >>>> It has (finally) been completed (at least in the Linus' git-tree).
> >>>>     
> >>>>         
> >>> We need to have that marked as completed or removed, please...
> >>>   
> >>>       
> >> Done (guess you meant on http://kernelnewbies.org/KernelJanitors/Todo).
> >>     
> >
> > Thanks, but what about the entry at fsdev.net ?
> > We don't want people starting on this project from there either...
> >   
> I must be blind, can not find anything about pci_module_init. Please 
> point me to it.
> I removed an entry with it a month ago when the pci_module_init-removal 
> patch got into mainline and have not seen anything about it since then.

My bad.  I was looking too quickly and read pci_find_device() [at fsdev.net]
as pci_module_init().  Sorry about that.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
