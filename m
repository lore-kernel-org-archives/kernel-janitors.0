From: Luciano Coelho <coelho@ti.com>
Date: Thu, 24 Jan 2013 07:28:24 +0000
Subject: Re: [patch] cfg80211: off by one in ieee80211_bss()
Message-Id: <1359012504.6252.187.camel@cumari.coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130124064000.GB5611@elgon.mountain>
In-Reply-To: <20130124064000.GB5611@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2013-01-24 at 09:40 +0300, Dan Carpenter wrote:
> We do a:
> 
> 	sprintf(buf, " Last beacon: %ums ago",
> 		elapsed_jiffies_msecs(bss->ts));
> 
> elapsed_jiffies_msecs() can return a 10 digit number so "buf" needs to
> be 31 characters long.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/wireless/scan.c b/net/wireless/scan.c
> index 01592d7..45f1618 100644
> --- a/net/wireless/scan.c
> +++ b/net/wireless/scan.c
> @@ -1358,7 +1358,7 @@ ieee80211_bss(struct wiphy *wiphy, struct iw_request_info *info,
>  						  &iwe, IW_EV_UINT_LEN);
>  	}
>  
> -	buf = kmalloc(30, GFP_ATOMIC);
> +	buf = kmalloc(31, GFP_ATOMIC);
>  	if (buf) {
>  		memset(&iwe, 0, sizeof(iwe));
>  		iwe.cmd = IWEVCUSTOM;

Looks good.  Also, to be on the safe side, shouldn't snprintf be used
when writing to buf as well? Same thing higher up where the same buf is
used and alloc'ed 50 bytes...

--
Luca.

