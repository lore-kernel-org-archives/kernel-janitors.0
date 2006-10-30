From: Ethan A Burns <eaburns@zeno.unh.edu>
Date: Mon, 30 Oct 2006 17:40:47 +0000
Subject: Re: [KJ] [PATCH] Changed all calls to pci_module_init to
Message-Id: <20061030174047.GA31369@zeno.unh.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061028201039.GB20208@zeno.unh.edu>
In-Reply-To: <20061028201039.GB20208@zeno.unh.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Ethan A Burns wrote:
> >Richard,
> >	New patch is at the bottom.  I was unaware of 
> >Documentation/feature-removal-schedule.txt.  Since this is already 
> >schedueled
> >for removal, does this mean that this is an unneeded patch?  This item was 
> >on
> >the TODO list, which is why I decided to take a stab at it.
> >
> >	--Ethan
> >
> >  
> (please don't top-post ;) )

	Sorry, I didn't know about top-posting, and probably other mailing
list etiquitte that we will findout as I go.

> 
> The cleaning up of the drivers is needed, it is just the removal of 
> pci_module_init() that needs to be left out (just to minimize the risk 
> of people complaining it was removed ahead of time). And if you don't 
> find anything more to do, I would appreciate any help to replace the 
> #define FALSE/TRUE-mess we currently have in the tree with the newly (in 
> linus-tree just before 2.6.19-rc1) added false/true (is defined in 
> include/linux/stddef.h).

I wouldn't mind doing that.  Just a simple find/replace of 'FALSE' with 'false'
and 'TRUE' with 'true'?  Even these simple (tedious) things are a good
learning experience for me, if nothing else than to just get use to sending
patches, etc.

	--Ethan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
