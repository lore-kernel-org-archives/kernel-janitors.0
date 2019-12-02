From: David Miller <davem@davemloft.net>
Date: Mon, 02 Dec 2019 21:13:27 +0000
Subject: Re: [PATCH] i2400m/USB: fix error return when rx_size is too large
Message-Id: <20191202.131327.1991319206654704992.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191202174246.77305-1-colin.king@canonical.com>
In-Reply-To: <20191202174246.77305-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: inaky@linux.intel.com, linux-wimax@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  2 Dec 2019 17:42:46 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the rx_size is too large the intended error
> -EINVAL is not being returned as this is being assigned to
> result rather than rx_skb. Fix this be setting rx_skb
> to ERR_PTR(-EINVAL) so that the error is returned in rx_skb
> as originally intended.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: a8ebf98f5414 ("i2400m/USB: TX and RX path backends")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This leaks rx_skb, the caller is supposed to clean up rx_skb
by freeing it if this function doesn't transmit it successfully.
