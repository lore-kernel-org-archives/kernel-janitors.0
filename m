From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 05 Feb 2004 21:50:57 +0000
Subject: Re: [Kernel-janitors] New guy here, and patch for kj.pl
Message-Id: <4022BAC1.7050904@gmx.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125123747.GA21585@noos.fr>
In-Reply-To: <20040125123747.GA21585@noos.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Domen Puncer wrote:
> On Thursday 05 of February 2004 11:20, Michael Veeck wrote:
> 
>>Hi! I'm another new guy here on kj and a few days ago I wrote a little
>>patch to show that I want to tackle the removal of some unnecessary
>>min/max-methods in the kernel.
>>
>>I didnt get any feedback yet, but I guess since nobody screamed (and I
>>found some more occurences) I'm going to try my best.
> 
> 
> No screaming is usually good :-)

Good, than I'll try finding some more Min/Max-Unnecessarieness and keep 
that diffed against the latest kernel until it gets included.

Is it preferrable to generate indivual patches or (since it isnt really 
intrusive) to post one big patch?

> 
> 
> <snipped some code that uses MAX in struct initializers>
> 
>>Can anyone help me with that error code?
> 
> 
> The problem is struct initializers can't be code (max evaluates to some code, 
> while MAX works fine, as the preprocessor does all the work).
> 
> In this case that MAX looks like the right thing, except for arguments used 
> twice in #define.
> 
> Any better ideas than leaving this as it is now?

I dont know (yet) if there are more of those min-in-struct-inits, so 
that we could put one #define in one place and remove the then obsolete 
ones.

Regards
Michael

> 
> 
> 	Domen
> 
> 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
