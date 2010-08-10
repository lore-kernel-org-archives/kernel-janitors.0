From: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Date: Tue, 10 Aug 2010 01:43:00 +0000
Subject: Re: [patch 2/2] qlcnic: using too much stack
Message-Id: <9F31A875-3A0B-4518-8106-1012E0D2799B@qlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100809103727.GH9031@bicker>
 <0081C370-65E2-434F-BBC6-C688F6F39750@qlogic.com>
 <20100809184254.GJ9031@bicker>
In-Reply-To: <20100809184254.GJ9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Amit Salecha <amit.salecha@qlogic.com>, Linux Driver <Linux-Driver@qlogic.com>, "David S. Miller" <davem@davemloft.net>, Sucheta Chakraborty <sucheta.chakraborty@qlogic.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


On Aug 10, 2010, at 12:12 AM, Dan Carpenter wrote:

> On Mon, Aug 09, 2010 at 09:46:32AM -0700, Anirban Chakraborty wrote:
>> 
>> It looks fine except that I'd use kzalloc instead of kcalloc above.
>> 
> 
> It's no problem to do that, and I'm already respinning the patches but 
> I'm confused.  It looks like pci_info gets initialized correctly.  What
> am I missing?

Your patch is fine except that the preferred way is to use kzalloc over kaclloc. kzalloc does not need that extra
argument that you are passing to kcalloc.

-Anirban