From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Sat, 12 Aug 2006 04:26:14 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <82faac5b0608112126x351b1db8ga6434acc4e7add4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
In-Reply-To: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day

On 8/10/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> On Thu, Aug 10, 2006 at 08:48:19AM +1000, Darren Jenkins wrote:
> > On 8/8/06, Pavel Machek <pavel@ucw.cz> wrote:
> > > > Sorry I did not realise that was your problem with the code.
> > > > Would it help if we just explicitly added a
> > > >
> > > > if (ready())
> > > >        return 0;
> > > >
> > > > after the loop, in the example code? so people wont miss adding
> > > > something like that in?
> > >
> > > Yes, that would do the trick.
> > >                                                                 Pavel
> >
> >
> > I was going to make a patch for the TODO, but it seems this subject
> > has since been removed.
> > Any chance it is going to be reinstated ? or is this subject
> > considered not so much janitorial work?
>
> I need to read through those threads so correct version will be present
> in TODO. So far, testing for OK condition was forgotten. Anything else?

No the problem that Pavel Machek showed us was the only one I saw.

>         unsigned long timeout = jiffies + HZ/2;
>        for (;;) {
>                if (ready())
>                        return 0;
> [IMAGINE HALF A SECOND DELAY HERE]
>                if (time_after(timeout, jiffies))
>                        break;
>                msleep(10);
>        }
>
> Oops



There were three proposed solutions though.

1) (mine)

unsigned long timeout = jiffies + HZ/2;

for (;;) {
        if (ready())
                return 0;
        if (time_after(timeout, jiffies))
                break;
        msleep(10);
}
if (ready())
        return 0;

       // timeout logic follows


2) (Om N's)

unsigned long timeout = jiffies + HZ/2;

for (;;) {
        if (ready())
                return 0;
        if (time_after(timeout, jiffies)) {
                if (ready())
                        return 0;
                break;
        }
        msleep(10);
}

       // timeout logic follows


3) (Andrew James Wade's)

unsigned long timeout = jiffies + HZ/2;
int timeup = 0;

for (;;) {
       if (ready())
               return 0;
       if (timeup)
               break;
       msleep(10);
       timeup = time_after(timeout, jiffies);
}
       // timeout logic follows


I like the 1'st and 3'rd, I guess that being the maintainer the choice
of solution is up to you. One of these three or one of your own. :)

Darren J
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
