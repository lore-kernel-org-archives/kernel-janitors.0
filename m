From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 28 Jan 2011 14:20:05 +0000
Subject: Re: [PATCH 1/2] net/wireless/nl80211.c: Avoid call to
Message-Id: <1296224405.5118.8.camel@jlt3.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1296224232-8115-1-git-send-email-julia@diku.dk>
	 <1296223267.5118.7.camel@jlt3.sipsolutions.net>
	 <Pine.LNX.4.64.1101281515410.8546@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1101281515410.8546@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2011-01-28 at 15:16 +0100, Julia Lawall wrote:

> > But why did you call the label differently? :)
> 
> Because out is already used in this case, and I didn't want to change all 
> of the other occurrences of nla_put_failure.  It's a bit sloppy though, 
> because this code is the actual nla_put_failure.  I can change it if you 
> prefer.

Oh, and I could've seen that from the patch itself too, I just missed
it, sorry.

johannes

