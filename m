From: "Andrej Zaikin" <zed.0xff@gmail.com>
Date: Wed, 16 Aug 2006 04:19:16 +0000
Subject: Re: [KJ] [PATCH] Add poll_event* interfaces (was Re: [patch] fix
Message-Id: <710c0ee0608152119q18fd8fdfs61d20a764ce799f6@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060812062818.GD4919@us.ibm.com>
In-Reply-To: <20060812062818.GD4919@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2006/8/16, Nishanth Aravamudan <nacc@us.ibm.com>:
> On 15.08.2006 [12:08:09 +0200], Pavel Machek wrote:
> > Hi!
> >
> > > > I think while you are hiding complexity in a macro, you should hide
> > > > the absolute time to jiffies conversion complexity(although not that
> > > > complex) too. It _is_ closely related to the interfaces you are
> > > > writing and in a lot of cases will probably be the only place the
> > > > conversion is used. So I say, bung it in there.
> > >
> > > Ok, below is my attempt at incorporating this. Also fixed a typo in
> > > poll_event_interruptible_timeout() and made a similar fix as 2) for
> > > the interruptible variants, where the condition takes precendence over a
> > > signal.
> >
> > Agreed, looks okay to me.
>
> Thanks, Pavel.
>
> Andrej, care to rework your patch using these macros, if possible?

Okay, I'll try
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
