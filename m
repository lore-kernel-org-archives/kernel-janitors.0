From: David Miller <davem@davemloft.net>
Date: Mon, 03 Jun 2019 00:51:20 +0000
Subject: Re: [PATCH] qed: remove redundant assignment to rc
Message-Id: <20190602.175120.2088142330404607316.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531132738.17221-1-colin.king@canonical.com>
In-Reply-To: <20190531132738.17221-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aelior@marvell.com, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 14:27:38 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is assigned with a value that is never read and
> it is re-assigned a new value later on.  The assignment is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
