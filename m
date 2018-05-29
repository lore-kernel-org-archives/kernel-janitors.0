From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 29 May 2018 10:01:44 +0000
Subject: Re: [PATCH] mac80211_hwsim: add error check to call to rhashtable_init
Message-Id: <1527588104.6955.10.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180529091412.8530-1-colin.king@canonical.com>
         <1527585428.6955.7.camel@sipsolutions.net>
         <20180529100049.up6wzjkzmd5a3v2q@mwanda>
In-Reply-To: <20180529100049.up6wzjkzmd5a3v2q@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2018-05-29 at 13:00 +0300, Dan Carpenter wrote:
> On Tue, May 29, 2018 at 11:17:08AM +0200, Johannes Berg wrote:
> > On Tue, 2018-05-29 at 10:14 +0100, Colin King wrote:
> > > 
> > > @@ -3573,7 +3573,9 @@ static int __init init_mac80211_hwsim(void)
> > >  	hwsim_wq = alloc_workqueue("hwsim_wq", 0, 0);
> > >  	if (!hwsim_wq)
> > >  		return -ENOMEM;
> > > -	rhashtable_init(&hwsim_radios_rht, &hwsim_rht_params);
> > > +	err = rhashtable_init(&hwsim_radios_rht, &hwsim_rht_params);
> > > +	if (err)
> > > +		return err;
> > 
> > That's missing a workqueue free, but I can fix that while applying if
> > you prefer.
> > 
> 
> And we don't free the hashtable on error either.

Heh. Ok, I guess I'll make a whole new commit to fix up all the things
here.

johannes
