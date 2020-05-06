From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 06 May 2020 20:37:45 +0000
Subject: Re: MAINTAINERS: Wrong ordering in S390 PCI SUBSYSTEM
Message-Id: <alpine.DEB.2.21.2005062232330.23358@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2005060741520.7719@felia> <CAHp75VeNiuJ7QXvNO2=W_TjEjjK3xRbg0-Don6HkSOHV5LXRbA@mail.gmail.com>
In-Reply-To: <CAHp75VeNiuJ7QXvNO2=W_TjEjjK3xRbg0-Don6HkSOHV5LXRbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pierre Morel <pmorel@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On Wed, 6 May 2020, Andy Shevchenko wrote:

> On Wed, May 6, 2020 at 8:46 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Hi Pierre,
> >
> > with your commit de267a7c71ba ("s390/pci: Documentation for zPCI"),
> > visible on next-20200505, ./scripts/checkpatch.pl -f MAINTAINERS
> > complains:
> >
> > WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
> > #14723: FILE: MAINTAINERS:14723:
> > +F:     drivers/pci/hotplug/s390_pci_hpc.c
> > +F:     Documentation/s390/pci.rst
> >
> >
> > This is due to wrong ordering of the entries in your submission. If you
> > would like me to send you a patch fixing that, please just let me know.
> >
> > It is a recent addition to checkpatch.pl to report ordering problems in
> > MAINTAINERS, so you might have not seen that at submission time.
> 
> Why not to send a patch?
> Same for the rest of similar mails from you.
> 

Well, the checkpatch warning is new, so I want to find out if and make 
sure that the involved developers are generally okay getting those patches 
or if there is a better way handling those patches to MAINTAINERS.

I do not expect that there are too many further cases of this warning 
appearing soon in linux-next now that checkpatch already warns about it.

Lukas
