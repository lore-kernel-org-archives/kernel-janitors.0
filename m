From: Andi Kleen <andi@firstfloor.org>
Date: Thu, 10 Jan 2008 09:25:28 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080110092528.GA25076@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <200801100952.55039.eike-kernel@sf-tec.de>
In-Reply-To: <200801100952.55039.eike-kernel@sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com

> Can you explain the rationale behind that running on the BKL? What type of 

It used to always run with the BKL because everything used to 
and originally nobody wanted to review all ioctl handlers in tree to see if 
they can run with more fine grained locking. A lot probably can though.

> things needs to be protected so that this huge hammer is needed? What would 
> be an earlier point to release the BKL?

That depends on the driver. A lot don't need BKL at all and 
in others it can be easily eliminated. But it needs case-by-case
review of the locking situation.

The goal of the proposal here is just to make it more visible.

-Andi
