From: "Paul Bonser" <misterpib@gmail.com>
Date: Wed, 10 Jan 2007 23:30:42 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <e6101e100701101530ne24c824wbb42166399738b80@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/10/07, Paul Bonser <misterpib@gmail.com> wrote:
> On 1/10/07, Darren Jenkins <darrenrjenkins@gmail.com> wrote:
> > On 1/11/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >
> > >  i'm still
> > > interested if there's a single (bitwise?) operation to do the rounding
> > > up or down without involving a loop, which would be cool, but i don't
> > > know if that's possible.  anyone?
> >
> > I don't think it is possible.
>
> Here's a constant-time version:

Whoops, I just realized that this doesn't give the right answer for
values over a certain amount. Is it proper to just return zero when
the next highest power of 2 is bigger than ULONG_MAX?

-- 
PaulB
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
