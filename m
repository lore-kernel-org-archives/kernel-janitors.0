From: Domen Puncer <domen@coderock.org>
Date: Thu, 05 Feb 2004 11:19:04 +0000
Subject: Re: [Kernel-janitors] New guy here, and patch for kj.pl
Message-Id: <200402051219.05072.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125123747.GA21585@noos.fr>
In-Reply-To: <20040125123747.GA21585@noos.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 05 of February 2004 11:20, Michael Veeck wrote:
> Hi! I'm another new guy here on kj and a few days ago I wrote a little
> patch to show that I want to tackle the removal of some unnecessary
> min/max-methods in the kernel.
>
> I didnt get any feedback yet, but I guess since nobody screamed (and I
> found some more occurences) I'm going to try my best.

No screaming is usually good :-)


<snipped some code that uses MAX in struct initializers>

> Can anyone help me with that error code?

The problem is struct initializers can't be code (max evaluates to some code, 
while MAX works fine, as the preprocessor does all the work).

In this case that MAX looks like the right thing, except for arguments used 
twice in #define.

Any better ideas than leaving this as it is now?


	Domen

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
