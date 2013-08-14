From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 14 Aug 2013 11:56:21 +0000
Subject: Re: [patch] nl80211: nl80211hdr_put() doesn't return an ERR_PTR
Message-Id: <1376481381.14574.0.camel@jlt4.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814115001.GB8044@elgon.mountain>
In-Reply-To: <20130814115001.GB8044@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2013-08-14 at 14:50 +0300, Dan Carpenter wrote:
> There are a few places which check nl80211hdr_put() for an ERR_PTR
> but actually it returns NULL on error and never error values.  In
> nl80211_testmode_dump() the return wasn't checked at all so I have added
> one.

Err, wow. How did we do this?!

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is static checker stuff and I don't know the code well.  I was
> especially not sure if I got the check right in nl80211_testmode_dump().
> Please review that bit carefully.

Yes, looks fine. I'll apply this for 3.11, thanks.

johannes

