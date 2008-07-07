From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Mon, 07 Jul 2008 18:44:42 +0000
Subject: Re: PCMCIA ioctl
Message-Id: <20080707184442.GA15051@isilmar.linta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30807070845m6fc24f78tf0ad5b8c11d46c92@mail.gmail.com>
In-Reply-To: <919fe2b30807070845m6fc24f78tf0ad5b8c11d46c92@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mark,

On Mon, Jul 07, 2008 at 11:45:58AM -0400, Mark Asselstine wrote:
> After looking at feature-removal-schedule.txt while doing some kernel
> janitor work I noticed that the PCMCIA ioctl was set for removal back
> in 2005 and that the kconfig was marked as obsolete along with printk
> warning people not to use the ioctl... So I was preparing to remove
> this but I notice you have recent commits related to the ioctl and so
> I want to run things by you first. Is this ioctl still being used? or
> should it be removed? I have attached a patch for Linus' tree but of
> course I would have to rework this against the PCMCIA tree. Anyways
> let me know, if I am better off spending time on something else that I
> will do. If you do want this gone let me know and as I say I will
> rework the patch to apply against the proper tree.

Unfortunately, there's still a prominent user of the IOCTL -- which means it
cannot go just now. I'll try to replace it with something more sensible, but
please don't push the removal patch just yet :)

Thanks and best wishes,
	Dominik
