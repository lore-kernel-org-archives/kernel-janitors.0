From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 24 Jan 2013 14:47:43 +0000
Subject: Re: [patch] cfg80211: off by one in ieee80211_bss()
Message-Id: <1359038863.21908.0.camel@jlt4.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130124064000.GB5611@elgon.mountain>
In-Reply-To: <20130124064000.GB5611@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2013-01-24 at 09:40 +0300, Dan Carpenter wrote:
> We do a:
> 
> 	sprintf(buf, " Last beacon: %ums ago",
> 		elapsed_jiffies_msecs(bss->ts));
> 
> elapsed_jiffies_msecs() can return a 10 digit number so "buf" needs to
> be 31 characters long.

Applied, thanks.

johannes

