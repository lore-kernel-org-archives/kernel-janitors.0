From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 08 May 2018 13:01:20 +0000
Subject: Re: [PATCH] mac80211: ethtool: avoid 32 bit multiplication overflow
Message-Id: <1525784480.14830.12.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180508125732.5153-1-colin.king@canonical.com>
In-Reply-To: <20180508125732.5153-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2018-05-08 at 13:57 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The multiplication of 100000 * cfg80211_calculate_bitrate() is a 32 bit
> operation and can overflow if cfg80211_calculate_bitrate is greater
> than 42949. Although I don't believe this is occurring at present, it
> would be safer to avoid the potential overflow by making the constant
> 100000 an ULL to ensure a 64 multiplication occurs.

Yeah it can't happen since mac80211 doesn't support 60 GHz devices, and
all others are limited to less than than.

Still, applied.

johannes
