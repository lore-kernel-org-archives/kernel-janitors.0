From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Wed, 09 Aug 2006 22:48:19 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <82faac5b0608091548q740ba32csd750d30b137e3a1b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
In-Reply-To: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day,

CC trimmed.

On 8/8/06, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
> > Sorry I did not realise that was your problem with the code.
> > Would it help if we just explicitly added a
> >
> > if (ready())
> >        return 0;
> >
> > after the loop, in the example code? so people wont miss adding
> > something like that in?
>
> Yes, that would do the trick.
>                                                                 Pavel


I was going to make a patch for the TODO, but it seems this subject
has since been removed.
Any chance it is going to be reinstated ? or is this subject
considered not so much janitorial work?


Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
