From: David Miller <davem@davemloft.net>
Date: Sat, 17 Mar 2012 20:58:54 +0000
Subject: Re: [PATCH] isdn: Return -EINTR in gigaset_start() if locking attempts fails.
Message-Id: <20120317.135854.570143927282385505.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331903413-11426-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120316.231856.1071253468993560433.davem@davemloft.net>
	<CAOD=uF6JJiiGjQwybzwdU3Zw9pC8YbDPxm_Pg9E9WNAXbfTiUQ@mail.gmail.com>
In-Reply-To: <CAOD=uF6JJiiGjQwybzwdU3Zw9pC8YbDPxm_Pg9E9WNAXbfTiUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: hjlipp@web.de, tilman@imap.cc, isdn@linux-pingi.de, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Sat, 17 Mar 2012 21:26:14 +0530

> Caller is interpreting 0 in opposite way of normal sequence.
> Thats why I misunderstood it.

The simple fact is that you didn't even look at the code at the call
sites when you wrote this patch, and that's the first thing anyone is
going to do when reviewing it.

Therefore your laziness results in more useless work for other people.
I just wanted to point out how selfish and anti-social this kind of
behavior is.
