From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 10 Aug 2006 12:16:11 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <20060810121611.GA6847@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
In-Reply-To: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 10, 2006 at 08:48:19AM +1000, Darren Jenkins wrote:
> On 8/8/06, Pavel Machek <pavel@ucw.cz> wrote:
> > > Sorry I did not realise that was your problem with the code.
> > > Would it help if we just explicitly added a
> > >
> > > if (ready())
> > >        return 0;
> > >
> > > after the loop, in the example code? so people wont miss adding
> > > something like that in?
> >
> > Yes, that would do the trick.
> >                                                                 Pavel
> 
> 
> I was going to make a patch for the TODO, but it seems this subject
> has since been removed.
> Any chance it is going to be reinstated ? or is this subject
> considered not so much janitorial work?

I need to read through those threads so correct version will be present
in TODO. So far, testing for OK condition was forgotten. Anything else?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
