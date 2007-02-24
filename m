From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sat, 24 Feb 2007 19:23:56 +0000
Subject: Re: [KJ] [RFC][PATCH] BIT macro cleanup
Message-Id: <20070224191001.GA9547@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45DEF5EE.4030002@student.ltu.se> <d120d5000702230657s1860efb3o6986277901f13d03@mail.gmail.com> <45DF1165.2080003@student.ltu.se> <d120d5000702230905r6b50a1bbm3b71551f855cdf01@mail.gmail.com> <45DF2F57.2080309@student.ltu.se> <d120d5000702231037q511f8073n47beed320f097458@mail.gmail.com> <45DF3C53.4030100@student.ltu.se> <d120d5000702231358j55cd6665x2add335ceb904c22@mail.gmail.com> <45DF6E20.9060604@student.ltu.se> <20070224111124.GB3609@suse.cz>
In-Reply-To: <20070224111124.GB3609@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vojtech Pavlik <vojtech@suse.cz>
Cc: Richard Knutsson <ricknu-0@student.ltu.se>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, linux-input@atrey.karlin.mff.cuni.cz, linux-joystick@atrey.karlin.mff.cuni.cz

On 12:11 Sat 24 Feb     , Vojtech Pavlik wrote:
> 
> That would be my only concern - losing compiler warnings.
yes
see
I wanted a single BIT macro which can be used by the whole tree

was looking for a multipurpose one.  found it in input.h
so i thought i will put it at a common place

why bitops.h? coz BIT qualifies for a "bitop" 
& bitops.h is  inclued by kernel.h, hence accessible from every part 
of the tree without mucb efforts

now
a> this was written for input user,so they are perfectly happy with it
only change would be now input.h will have
 to fetch it from bitops.h..trivial

b> currently almost all other users of BIT are well within the BITS_PER_LONG
limit

c>but it is not sutaible for  those who want to go beyond this limit, 
as they will not be warned 

Now if we have LLBIT which takes care of above case
[& as  LLBIT has no wrap it will warn if we go beyond "long long" for
some reason]

So all we need is  people to be carefull  before passing anything to BIT
& use LLBIT whereever appropriate

so  now i think it should be ok to have

#define BIT(nr) (1UL << ((nr) % BITS_PER_LONG))
#define LLBIT(nr) (1ULL << (nr))


thoughts

> > And what about the "1%"?
> 
> The 1% will need either LLBIT or an extra % 8.

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
