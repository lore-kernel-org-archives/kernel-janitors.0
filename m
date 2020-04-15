From: David Miller <davem@davemloft.net>
Date: Wed, 15 Apr 2020 23:20:38 +0000
Subject: Re: [PATCH] ipv6: remove redundant assignment to variable err
Message-Id: <20200415.162038.1967911463518921168.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200415231630.1568296-1-colin.king@canonical.com>
In-Reply-To: <20200415231630.1568296-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Apr 2020 00:16:30 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
