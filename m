From: Simon Arlott <simon@fire.lp0.eu>
Date: Sun, 22 Jul 2007 19:16:23 +0000
Subject: Re: diffutils: C labels misdetected as functions
Message-Id: <46A3AD07.1070504@simon.arlott.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com>	<4699EEA9.6070709@simon.arlott.org.uk>	<20070720170743.GF14791@parisc-linux.org>	<46A0F282.8070103@simon.arlott.org.uk>	<20070720180019.GJ14791@parisc-linux.org>	<46A1A375.3020900@simon.arlott.org.uk>	<20070721135200.GQ14791@parisc-linux.org>	<46A25BE0.7000104@simon.arlott.org.uk> <87abtogu6u.fsf@penguin.cs.ucla.edu>
In-Reply-To: <87abtogu6u.fsf@penguin.cs.ucla.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Eggert <eggert@CS.UCLA.EDU>
Cc: Matthew Wilcox <matthew@wil.cx>, Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, git@vger.kernel.org

On 22/07/07 19:38, Paul Eggert wrote:
> Simon Arlott <simon@fire.lp0.eu> writes:
> 
>> The patch below stops diffutils treating C labels starting in column 1 as function names.
> 
> That patch alone wouldn't suffice, since -p is documented as implying
> -F '^[[:alpha:]$_]'.  If the behavior changes, we'd also have to
> change the documentation to match.

Ok.

> I'm not sure the change is a good idea.  It would complicate the
> documentation and therefore the user interface, without that much

Complicated documentation means a bug shouldn't be fixed?

> benefit.  And it wouldn't suffice in general, since it would still
> mishandle labels followed by comments or by white space.

Yes, the regexp needs changing further to ignore comments...

"[[:alpha:]$_][^:]*$" perhaps? Although that ignores functions with
comments on the same line containing a :.

> Also, for long C functions some people might rather see a top-level
> (unindented) label highlighted than the function name highlighted, so
> they might prefer the current behavior.

"-p  --show-c-function  Show which C function each change is in."

It's not "--show-c-function-or-label".

> Anyway, to work around your problem without changing "diff", you can
> use "diff -u -F '^[[:alpha:]$_](|.*[^:])$'" instead of "diff -u -p".

Perhaps git could do this (or similar) as a workaround? (Cc:ed)

> Or you can put a single space before the labels in question: they'll
> still stand out plenty.

The code should definitely not need to be modified to work around a
diff bug.

-- 
Simon Arlott
