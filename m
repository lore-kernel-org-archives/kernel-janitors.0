From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 08 Jan 2007 23:15:52 +0000
Subject: Re: [KJ] another cleanup TO DO:  is_power_of_2() check
Message-Id: <Pine.LNX.4.64.0701081814320.3181@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701081732070.25196@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701081732070.25196@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 8 Jan 2007, Frederik Deweerdt wrote:

> On Mon, Jan 08, 2007 at 05:37:16PM -0500, Robert P. J. Day wrote:
> >
> >   there are *numerous* places in the code that check if some value is
> > a power of 2 using the basic test "((x & (x - 1)) = 0)":
> >
> >   $ grep -Er "(.*) ?\& ?\(\1 ?- ?1\)" .
> >
> > as you can see, that test is all over the place.
> >
> >   occasionally, someone decides to do the right thing and define a
> > macro:
> >
> >   $ grep -r "#define is_power_of_2" .

> Some of which really are is_power_of_2_but_not_0 :).

yes, i had noticed that.

> That corner case set aside, but it is handled differently throughout
> the source, it seems fine to me.

*what* seems fine?  making the change, or leaving it as is?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
