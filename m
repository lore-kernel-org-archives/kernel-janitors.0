From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 24 May 2007 23:14:40 +0000
Subject: Re: [KJ] Anybody is working on this todo ?
Message-Id: <Pine.LNX.4.64.0705241914150.4092@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
In-Reply-To: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 24 May 2007, Richard Knutsson wrote:

> linux newbie wrote:
> >
> > > Looking at pci.txt, it appears that if I use pci_get_device(), I will >
> > also need to use pci_dev_put().
> >
> > also check using the proper shutdown callback.
> >
> If you have not seen it already, there is a wiki:
> http://fsdev.net/wiki/index.php?title=Kernel_Janitor%27s_Todo_List
> >
> > - convert from pci_module_init to pci_register_driver
> >
> It has (finally) been completed (at least in the Linus' git-tree).

in that case, feel free to edit the wiki and remove that entry.  no
sense leaving it hanging around.

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
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
