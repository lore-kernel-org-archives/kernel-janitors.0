From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 10:35:01 +0000
Subject: Re: [PATCH] fjes: use currently unused variable my_epid and max_epid
Message-Id: <20180705.193501.2058429078262964742.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705100532.22277-1-colin.king@canonical.com>
In-Reply-To: <20180705100532.22277-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Jul 2018 11:05:32 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables my_epid and max_epid are currently assigned and not being
> used - however, I suspect they were intended to be used in the for-loops
> to reduce the dereferencing of hw.  Replace hw->my_epid and hw->max_epid
> with these variables.
> 
> Cleans up clang warnings:
> warning: variable 'my_epid' set but not used [-Wunused-but-set-variable]
> variable 'max_epid' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
