From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 09:50:18 +0000
Subject: Re: FRV-setup: Clarification for "source code clean-up"?
Message-Id: <9944c3e8-f030-a500-682c-7a7c7a1f492b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
 <81f557b2-40f3-0625-331d-c5b115f1971c@users.sourceforge.net>
 <alpine.LNX.2.00.1610210923330.31629@cbobk.fhfr.pm>
 <20161021075142.GS4469@mwanda>
 <139f8031-4823-8de4-1a79-0af80f82cd89@users.sourceforge.net>
 <20161021092730.GJ4418@mwanda>
In-Reply-To: <20161021092730.GJ4418@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Kosina <jikos@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> How are you going to fix bugs if you only send clean ups?

I would prefer an other wording than "only" in your question.

I imagine that probabilities and views will matter more for the handling
of a software error spectrum.


>> How do you think about to discuss corresponding software development
>> statistics in more detail?
> 
> I think normal developers should fix 10 bugs or add a few features for
> every regression they introduce.

Are you looking for compensation possibilities?


> I introduced a regression just last week, so that's a normal part of life,

Thanks that you could also admit a programming mistake.


> but I was at least *trying* to fix a bug when I did it.

I am also trying to improve various software.

* We have got just different development opinions about the relevance
  of some changes. Can such a disagreement be a useful source for
  interesting ideas?

* We are used to inform further contributors about results from static
  source code analysis.
  These tools can find a bunch of open issues because of the automatic
  application of special search patterns. The importance of such findings
  will vary as usual.

Regards,
Markus
