From: David Miller <davem@davemloft.net>
Date: Wed, 18 Jul 2018 22:11:57 +0000
Subject: Re: [PATCH] ipv6: fix useless rol32 call on hash
Message-Id: <20180719.071157.192880975693614441.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180717161239.30782-1-colin.king@canonical.com>
In-Reply-To: <20180717161239.30782-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 17:12:39 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The rol32 call is currently rotating hash but the rol'd value is
> being discarded. I believe the current code is incorrect and hash
> should be assigned the rotated value returned from rol32.
> 
> Thanks to David Lebrun for spotting this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Also applied and queued up for -stable, thanks.
