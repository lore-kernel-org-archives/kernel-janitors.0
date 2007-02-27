From: burns.ethan@gmail.com
Date: Tue, 27 Feb 2007 17:50:20 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <20070227175020.GA20543@bender.eaburns.mooo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 27, 2007 at 06:31:18PM +0100, Bernhard R. Link wrote:
> * burns.ethan@gmail.com <burns.ethan@gmail.com> [070227 17:41]:
> > Looks like strlcpy() would solve both these problems.
>
> While there may be cases where it is useful, it normally solves
> a problem that is not there.
>
>         ssize = strlen(src) + 1;
>         if( ssize > dsize )
>                 return ERROR;
>         memcpy(dest, src, ssize);
>
> is the same like
>
> > 	ssize = strlcpy(dest, src, dsize);
> > 	if (ssize >= dsize - 1)
> > 		return ERROR;
> >
> > Here we have dest guaranteed to be terminated, and if the source string is
> > greater than the dest - 1 (for the '\0'), we can bail out.

Sure, however your way allows for the dest buff length test to be left off
(forgotten).  If the convention was to use strlcpy() the test is forced by
requiring the length argument to be passed.  strlcpy() uses memcpy()
under-the-hood anyway so there's no real efficiency differences here, AFAIK.

Also, the strlcpy() version is 1 line shorter (which is not *terribly*
important) and arguably more readable (not a very strong argument).

Finally if truncation is not a problem, strlcpy() handles this case just
as fine as anything and is probably preferable to a memcpy() with a length
test.  So might as well use strlcpy() in both places for consistency.


                --Ethan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
