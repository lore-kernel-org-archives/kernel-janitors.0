From: David Miller <davem@davemloft.net>
Date: Tue, 15 Oct 2019 16:58:51 +0000
Subject: Re: [PATCH] net: b44: remove redundant assignment to variable reg
Message-Id: <20191015.125851.2305315548091261475.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191011172232.14430-1-colin.king@canonical.com>
In-Reply-To: <20191011172232.14430-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: michael.chan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Oct 2019 18:22:32 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable reg is being assigned a value that is never read
> and is being re-assigned in the following for-loop. The
> assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
