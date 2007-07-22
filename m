From: Paul Eggert <eggert@CS.UCLA.EDU>
Date: Sun, 22 Jul 2007 18:38:33 +0000
Subject: Re: diffutils: C labels misdetected as functions
Message-Id: <87abtogu6u.fsf@penguin.cs.ucla.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com>
	<4699EEA9.6070709@simon.arlott.org.uk>
	<20070720170743.GF14791@parisc-linux.org>
	<46A0F282.8070103@simon.arlott.org.uk>
	<20070720180019.GJ14791@parisc-linux.org>
	<46A1A375.3020900@simon.arlott.org.uk>
	<20070721135200.GQ14791@parisc-linux.org>
	<46A25BE0.7000104@simon.arlott.org.uk>
In-Reply-To: <46A25BE0.7000104@simon.arlott.org.uk> (Simon Arlott's message of "Sat\, 21 Jul 2007 20\:17\:52 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Matthew Wilcox <matthew@wil.cx>, Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Simon Arlott <simon@fire.lp0.eu> writes:

> The patch below stops diffutils treating C labels starting in column 1 as function names.

That patch alone wouldn't suffice, since -p is documented as implying
-F '^[[:alpha:]$_]'.  If the behavior changes, we'd also have to
change the documentation to match.

I'm not sure the change is a good idea.  It would complicate the
documentation and therefore the user interface, without that much
benefit.  And it wouldn't suffice in general, since it would still
mishandle labels followed by comments or by white space.

Also, for long C functions some people might rather see a top-level
(unindented) label highlighted than the function name highlighted, so
they might prefer the current behavior.

Anyway, to work around your problem without changing "diff", you can
use "diff -u -F '^[[:alpha:]$_](|.*[^:])$'" instead of "diff -u -p".
Or you can put a single space before the labels in question: they'll
still stand out plenty.
