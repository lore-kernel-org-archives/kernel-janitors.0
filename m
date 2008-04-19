From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 19 Apr 2008 13:43:16 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <20080419134316.GH20637@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 18, 2008 at 09:08:55PM +0200, Julia Lawall wrote:
> I found 63 occurrences of this problem with the following semantic match
> (http://www.emn.fr/x-info/coccinelle/):
> 
> @@ unsigned int i; @@
> 
> * i < 0

Could you also look for unsigned long?

> I looked through all of the results by hand, and they all seem to be 
> problems.  In many cases, it seems like the variable should not be 
> unsigned as it is used to hold the return value of a function that might 
> return a negative error code, but I haven't looked into this in detail.

The problem will be if the variable is supposed to be unsigned in some
uses and signed in others.  The IS_ERR_VALUE() macro from linux/err.h
may be useful for this.

> In the output below, the lines that begin with a single start contain a 
> test of whether an unsigned variable or structure field is less than 0.
> The output is actually generated with diff, but I converted the -s to *s 
> to avoid confusion.

I'll respond to some of these, cc'ing the appropriate people.  Thanks
for doing this.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
