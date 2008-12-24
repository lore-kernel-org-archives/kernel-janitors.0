From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Dec 2008 02:10:27 +0000
Subject: Re: [PATCH 02/27] drivers/net: fix sparse warnings: make do-while
Message-Id: <alpine.LFD.2.00.0812231808030.3535@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net> <20081222191507.11807.50794.stgit@vmbox.hanneseder.net> <m3hc4voo2a.fsf@maximus.localdomain> <a01a16b50812221544x45c3559ap808ac0095ee8f01@mail.gmail.com> <m3ocz2ua3w.fsf@maximus.localdomain>
 <1230053186.1447.9.camel@brick> <m3k59qssix.fsf@maximus.localdomain> <alpine.LFD.2.00.0812231008350.3535@localhost.localdomain> <m3hc4usco9.fsf@maximus.localdomain> <alpine.LFD.2.00.0812231529030.3535@localhost.localdomain>
 <m3myemqqgp.fsf@maximus.localdomain>
In-Reply-To: <m3myemqqgp.fsf@maximus.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: Harvey Harrison <harvey.harrison@gmail.com>, =?ISO-8859-15?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>, Hannes Eder <hannes@hanneseder.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 24 Dec 2008, Krzysztof Halasa wrote:
> 
> People learn, or should, through the life :-)

Sure. But you should learn about the things that matter - not learn to 
avoid the stupid pitfalls that come from confusingly doing things so that 
they visually look similar even when they do different things.

So don't make people learn by putting traps in their face. That just 
wastes everybodys time.

> I'm not sure being common or less common does matter here much.
> 
> OTOH I think it's pretty common. Approx as common as while (x) y is,
> isn't it?

I doubt it. It certainly wasn't in the kernel. When we added the sparse 
warning, I think we got a couple of hits. 

Anyway,  not worth discussing. The fact is, the kernel does not accept do 
while without braces. I told you why. You can ignore it. I'll ignore you.

		Linus
