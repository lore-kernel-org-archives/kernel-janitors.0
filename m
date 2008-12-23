From: Harvey Harrison <harvey.harrison@gmail.com>
Date: Tue, 23 Dec 2008 17:26:26 +0000
Subject: Re: [PATCH 02/27] drivers/net: fix sparse warnings: make do-while
Message-Id: <1230053186.1447.9.camel@brick>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	 <20081222191507.11807.50794.stgit@vmbox.hanneseder.net>
	 <m3hc4voo2a.fsf@maximus.localdomain>
	 <a01a16b50812221544x45c3559ap808ac0095ee8f01@mail.gmail.com>
	 <m3ocz2ua3w.fsf@maximus.localdomain>
In-Reply-To: <m3ocz2ua3w.fsf@maximus.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Krzysztof Halasa <khc@pm.waw.pl>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>, Hannes Eder <hannes@hanneseder.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2008-12-23 at 17:31 +0100, Krzysztof Halasa wrote:
> "Håkon Løvdal" <hlovdal@gmail.com> writes:
> 
> > For this specific issue the important aspect is to improve readability
> > (and not just eventually satisfy some warning from a tool), which I
> > assume there is no disagrement on.
> 
> Precisely.
> 
> > Now what constitutes improved
> > readbility on the other hand is another issue, and I guess there are
> > next to as many oppinions as developers... :)
> 
> Yes. Thus the brackets (or lack of them) of do-while loops should
> never be forced as a part of coding standard/tools. This is just an
> unimportant detail of personal style and trying to force it is simply
> damaging to all of us.
> 
> > Of secondary importance is the benefit that always using brackets
> > makes them much more merge friendly.
> 
> There are many ways to make the code more merge friendly at a cost of
> readability. Hope we don't go this way.

Linus himself added that particular warning to sparse...may want to check
with him the reason for it.

Harvey

