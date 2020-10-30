From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 30 Oct 2020 09:08:49 +0000
Subject: Re: [PATCH][next] nl80211/cfg80211: fix potential infinite loop
Message-Id: <923bdb745be04732ee451b8d1b78b3d915b54b16.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029222407.390218-1-colin.king@canonical.com>
In-Reply-To: <20201029222407.390218-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Tova Mussai <tova.mussai@intel.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2020-10-29 at 22:24 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The for-loop iterates with a u8 loop counter and compares this
> with the loop upper limit of request->n_ssids which is an int type.
> There is a potential infinite loop if n_ssids is larger than the
> u8 loop counter, so fix this by making the loop counter an int.

Makes sense, thanks. I'll apply it to next.

For the record, it shouldn't be possible for request->n_ssids to be
larger than what the driver limit was, and that's 20 by default and
doesn't make sense to be really much higher than that, so in practice
this won't happen.

johannes
