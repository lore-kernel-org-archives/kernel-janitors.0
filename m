From: David Miller <davem@davemloft.net>
Date: Tue, 29 Oct 2019 19:09:21 +0000
Subject: Re: [PATCH] net: fec: remove redundant assignment to pointer bdp
Message-Id: <20191029.120921.2011958937132520274.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191025172255.4742-1-colin.king@canonical.com>
In-Reply-To: <20191025172255.4742-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: fugang.duan@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 18:22:55 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer bdp is being assigned with a value that is never
> read, so the assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
