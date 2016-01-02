From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Jan 2016 09:08:46 +0000
Subject: Re: net-libertas: Better exception handling in if_spi_host_to_card_worker()
Message-Id: <5687939E.7010701@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5686F0B2.5000000@users.sourceforge.net>
 <56870866.7020000@cogentembedded.com>
 <568785B3.5000905@users.sourceforge.net>
 <alpine.DEB.2.02.1601020914100.2063@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1601020914100.2063@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> I assume that a software development taste can evolve, can't it?
> 
> So far, you have gotten several down votes for this kind of change,

I am curious when more contributors will share corresponding opinions.


> and no enthusiasm.

How many software designers and developers can become enthusiastic
about better exception handling to some degree?


> The code that is performance critical, you should probably not touch, ever.

I imagine that technical evolution will result in further considerations
so that "unchangeable" components can be adjusted once more.


> The people who wrote it knew what was important and what was not.

I might come along at some places where the affected knowledge will also evolve.

Regards,
Markus
