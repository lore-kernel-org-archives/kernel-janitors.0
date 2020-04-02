From: David Miller <davem@davemloft.net>
Date: Thu, 02 Apr 2020 13:58:06 +0000
Subject: Re: [PATCH] net: ipv6: rpl_iptunnel: remove redundant assignments to variable err
Message-Id: <20200402.065806.2056385842327013538.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402101859.502158-1-colin.king@canonical.com>
In-Reply-To: <20200402101859.502158-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  2 Apr 2020 11:18:59 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never
> read and it is being updated later with a new value.  The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
