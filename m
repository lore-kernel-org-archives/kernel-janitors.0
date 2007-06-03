From: Rene Herman <rene.herman@gmail.com>
Date: Sun, 03 Jun 2007 09:12:04 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <466285E4.2030603@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/02/2007 05:29 PM, Robert P. J. Day wrote:

> On Sat, 2 Jun 2007, Matthew Wilcox wrote:

>> Why are comments considered useful, yet commented-out sections of
>> code considered worthy of deletion?
> 
> gee, matt, i dunno ... could it be that, if some code has been deleted
> via "#if 0", it might actually no longer have any value?  could *that*
> be it?

No ofcourse it could not. If it didn't have any value any longer it would have 
been deleted, not turned into a comment.

The value #if 0 code generally retains is documentation. Documentation on how 
things were done before and/or could be done in the future, but are not done 
now. It's documentation for the current developer but even more importantly, a 
future developer. Any "I tried this, but this didn't work quite right yet" or 
"I'd like to do it this way, but this needs something else first" or similar 
information this conveys is very useful, especially over maintainer changes.

Ofcourse, noone should go overboard with it but people don't. If something has 
no value anymore, it's deleted. It's only kept as a comment when it _is_ seen to 
have value in some or other form and as such deleting it is not a janitorial 
task but something that needs a maintainer. If the code sees active maintainance 
it still being there already means it's seen to still have value and if the code 
does not, it should most certainly be left alone as documentation for a possible 
next person stepping in.

A suggestion that any #if 0 code should preferably have a comment describing why 
it's there would ofcourse not be bad.

Rene.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
