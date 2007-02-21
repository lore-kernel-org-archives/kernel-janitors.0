From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Wed, 21 Feb 2007 10:46:59 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <3b44d3fb0702210234h5926dfcej55a6916defdffe11@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/21/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
> > how abt providing them a separate one
> >
> > #define BITWRAP(nr) (1UL<<((nr)%BITS_PER_LONG))
> Would it be ugly to just do:
> BIT(nr % BITS_PER_LONG);
> I mean, it clearly shows then what they want + what about if someone
> would like to wrap on a byte? With this, it is just:
> BIT(nr % BITS_PER_BYTE);
hmm..good point

> > & for others
> > #define BIT(nr) (1UL<<(nr))
> > #define LLBIT(nr) (1ULL<<(nr))
> Looks good
> >
> > so that gcc only will guide them whether to use  BIT or LLBIT
> > depending  upon size of long  & the "nr" value .
> How do you mean, gcc "will guide them"?
>
I mean if somebody blindly passes a value greater than BITS_PER_LONG
[on architectures where long & long long aren't of same size]
gcc would complain with
:warning: left shift count >= width of type
so they will backtrack & come to see whats cooking inside BIT
& on the very next line they notice that there is LLBIT
which they can use & live happily ever after.

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
