From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 15:35:44 +0000
Subject: Re: [PATCH] nl80211: fix memory leak in nl80211_get_ftm_responder_stats
Message-Id: <dc0edb88-457f-fde8-4d91-d5b3b94bfb6d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004194220.19412-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004194220.19412-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In nl80211_get_ftm_responder_stats, a new skb is created via nlmsg_new
> named msg. If nl80211hdr_put() fails, then msg should be released. The
> return statement should be replace by goto to error handling code.

Please improve this change description (also by avoiding a typo).

Regards,
Markus
