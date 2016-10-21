From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 11:38:19 +0000
Subject: Re: Improving software around DMA API usage?
Message-Id: <583c4707-c568-727c-a3d0-bef8caf255e0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
 <81f557b2-40f3-0625-331d-c5b115f1971c@users.sourceforge.net>
 <alpine.LNX.2.00.1610210923330.31629@cbobk.fhfr.pm>
 <20161021075142.GS4469@mwanda>
 <139f8031-4823-8de4-1a79-0af80f82cd89@users.sourceforge.net>
 <20161021092730.GJ4418@mwanda>
 <9944c3e8-f030-a500-682c-7a7c7a1f492b@users.sourceforge.net>
 <20161021102237.GK4418@mwanda> <alpine.DEB.2.10.1610211300540.3212@hadrien>
In-Reply-To: <alpine.DEB.2.10.1610211300540.3212@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jiri Kosina <jikos@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> If you want to do something that might be useful, you could look into the
> problem of missing checks for dma mapping failure.  There is  nice slide
> presenatation about the issue:
> 
> http://www.slideshare.net/SamsungOSG/shuah-khan-dmamaperror

Thanks for your suggestion about the software development idea
"Detecting Silent Data Corruptions using Linux DMA Debug API"
by Shuah Khan (from the year 2013).


> The slides are from a few years ago, but I did a small test recently,
> and the problem seems to persist.

Does this information indicate anything about the corresponding software
development attention?


> This needs to be done slowly and carefully, because when there is a failure,
> you need to figure out what to do to clean up and what value to return.

I imagine that some tools can help here again with static source code analysis,
can't they?


> There is no point to clean up all of the other checkpatch errors in the file
> at the same time.

Do you prefer to leave them over for newcomers?   ;-)


> Just stay on the problem at hand.

* Can further evolution also around software like "Coccinelle" help to improve
  the described situation?

* Are the chances becoming better around advanced data flow analysis
  by other analysis and design approaches?

Regards,
Markus
