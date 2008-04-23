From: Julia Lawall <julia@diku.dk>
Date: Wed, 23 Apr 2008 18:58:39 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.64.0804232053340.13226@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 23 Apr 2008, Roel Kluin wrote:

> Thanks for your feedback, julia, I finally used 
> 
> (
> * i < 0
> |
> * i < -C
> |
> * i > -C
> |
> * i <= -C
> |
> * i >= -C
> )
> 
> I noted you had more results in the same files. Is there a difference
> in results when you remove the asterisks before the expression?

I'm not sure to understand the question.  * means "tell me about this 
item".  So if you remove the *, it will do same the match, but it won't 
give you any output.

Sometimes I have posted to the kernel janitors mailing list semantic 
patches, in which - and + are used to remove and add things, rather than 
*, which just finds things.  The semantics of the matching done with - and 
+ is slightly different from the semantics with *, in that with - and +, 
all control-flow paths from the first node matched by the pattern have to 
use the metavariables (eg C) in a consistent way, whereas with * there 
just has to exist a single path that matches the pattern.  But this is not 
relevant to our example, because we are just matching individual terms.

julia

