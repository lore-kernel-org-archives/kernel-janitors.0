From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 24 May 2007 18:25:25 +0000
Subject: Re: [KJ] Anybody is working on this todo ?
Message-Id: <20070524112525.dcf1f61e.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
In-Reply-To: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 24 May 2007 19:55:02 +0200 Richard Knutsson wrote:

> linux newbie wrote:
> >
> > > Looking at pci.txt, it appears that if I use pci_get_device(), I 
> > will > also need to use pci_dev_put().
> >
> > also check using the proper shutdown callback.
> >
> If you have not seen it already, there is a wiki: 
> http://fsdev.net/wiki/index.php?title=Kernel_Janitor%27s_Todo_List
> >
> > - convert from pci_module_init to pci_register_driver
> >
> It has (finally) been completed (at least in the Linus' git-tree).

We need to have that marked as completed or removed, please...


> BTW 'newbie', it is much preferred if you use your real name, especially 
> when you are going to be an author to patches. Or at least get a more 
> unique alias.

Right.

> We are all newbies in the beginning, you know. ;)


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
