From: David Miller <davem@davemloft.net>
Date: Wed, 28 Aug 2019 21:49:54 +0000
Subject: Re: [PATCH] wimax/i2400m: remove redundant assignment to variable result
Message-Id: <20190828.144954.1478179832714843543.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827114739.27305-1-colin.king@canonical.com>
In-Reply-To: <20190827114739.27305-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: inaky.perez-gonzalez@intel.com, linux-wimax@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Aug 2019 12:47:39 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable result is being assigned a value that is never read and result
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
> 
> Addresses-Coverity: ("Ununsed value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
