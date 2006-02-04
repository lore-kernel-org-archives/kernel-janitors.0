From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Sat, 04 Feb 2006 16:38:53 +0000
Subject: Re: [KJ] [PATCH] - request_region
Message-Id: <9a8748490602040838q7c44a8aclbb962f642739f59d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
In-Reply-To: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/4/06, Ron Gage <ron@rongage.org> wrote:
> Quoting Jaco Kroon <jaco@kroon.co.za>:
>
> > Ron Gage wrote:
> >> Greetings:
> >>
> >> Trial patch - want to make sure that I am doing things "correctly"
> >> before I dive
> >> in too far...
> >>
> >> diff -ur linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c
> >> linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c
> >
> > I don't think there is a reason to show the diff command.
> >
>
> Diff puts that in there - shall I remove it?
>

Leave it, it does not harm and at least it lets one easily see the
diff options used to create the patch.


>
> >> --- linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c  2006-01-02
> >> 21:21:10.000000000 -0600
> >> +++ linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c       2006-02-04
> >> 10:29:03.000000000 -0600
> >
> > line wrapped.
> >
>
> Will fix by attaching the diff instead of just cut and paste...
>

It's really nice to have patches inline in mails, not attached.
Attachments requires you to open a sepperate file (possibly having to
save it first) just to read a patch. Also, when replying and wanting
to comment on a patch, few mailers include attachments in the reply,
requireing the person wanting to comment to manually insert the patch
and quote it  - really annoying.

The proper solution is to use a MUA that lets you insert files into
mails without mangling them, such as pine, mutt, kmail and others.


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
