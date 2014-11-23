From: David Miller <davem@davemloft.net>
Date: Sun, 23 Nov 2014 04:36:54 +0000
Subject: Re: net: Hyper-V: Deletion of an unnecessary check before the function call "vfree"
Message-Id: <20141122.233654.279540319568229037.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <546FB98E.5070703@users.sourceforge.net>
	<20141121.172705.540279259389643572.davem@davemloft.net>
	<54712F8C.10206@users.sourceforge.net>
In-Reply-To: <54712F8C.10206@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: haiyangz@microsoft.com, kys@microsoft.com, devel@linuxdriverproject.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Nov 2014 01:51:24 +0100

>> This has nothing to do with me asking you to frame your patches
>> against the correct tree.
> 
> I imagine than someone other can also pick up this update suggestion
> (a simple change of two lines) quicker before I might try another
> software build again from a different commit as a base.

Whereas if you learn how to base your changes cleanly on the correct
base now, all of your future submissions will go quickly and smoothly
into my tree.
