From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Thu, 24 May 2007 17:55:02 +0000
Subject: Re: [KJ] Anybody is working on this todo ?
Message-Id: <4655D176.9070601@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
In-Reply-To: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

linux newbie wrote:
>
> > Looking at pci.txt, it appears that if I use pci_get_device(), I 
> will > also need to use pci_dev_put().
>
> also check using the proper shutdown callback.
>
If you have not seen it already, there is a wiki: 
http://fsdev.net/wiki/index.php?title=Kernel_Janitor%27s_Todo_List
>
> - convert from pci_module_init to pci_register_driver
>
It has (finally) been completed (at least in the Linus' git-tree).

BTW 'newbie', it is much preferred if you use your real name, especially 
when you are going to be an author to patches. Or at least get a more 
unique alias.
We are all newbies in the beginning, you know. ;)

Happy hacking
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
