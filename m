From: Andrew James Wade <andrew.j.wade@gmail.com>
Date: Thu, 10 Aug 2006 00:25:01 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <200608092025.02259.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com> <82faac5b0608071753q71050d72uadcf55bc1e54f30e@mail.gmail.com> <6de39a910608071953l39ce0873w713d59eda4aa5d84@mail.gmail.com>
In-Reply-To: <6de39a910608071953l39ce0873w713d59eda4aa5d84@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Om N." <xhandle@gmail.com>
Cc: kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

[resending due to delivery failure.]

On Monday 07 August 2006 22:53, Om N. wrote:
> On 8/7/06, Darren Jenkins <darrenrjenkins@gmail.com> wrote:
> > G'day
> >
> > On 8/8/06, Pavel Machek <pavel@suse.cz> wrote:
> > >
> > > But you have to make sure YOU CHECK READY AFTER THE TIMEOUT. Linus'
> > > code does not do that.
> > >                                                                 Pavel
> >
> >
> > Sorry I did not realise that was your problem with the code.
> > Would it help if we just explicitly added a
> >
>       unsigned long timeout = jiffies + HZ/2;
>        for (;;) {
>                if (ready())
>                        return 0;
> [IMAGINE HALF A SECOND DELAY HERE]
>                if (time_after(timeout, jiffies)) {
>                        if (ready())
>                               return 0;
>                        break;
>                 }
>                msleep(10);
>        }
> Wouldn't this be better than adding a check after the break of loop?

You're getting duplicated code there. That'll be an issue in more
complex loops. How about:

unsigned long timeout = jiffies + HZ/2;
int timeup = 0;

for (;;;) {
	if (ready())
 		return 0;
	if (timeup)
		break;
	msleep(10);
	timeup = time_after(timeout, jiffies);
};
... timeout ...

However care is needed with the use of timeup, since timeup=1 only
indicates failure at the point it's tested in the loop; in particular
it won't indicate failure after the loop if "return 0" is changed to
"break".

Andrew Wade
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
