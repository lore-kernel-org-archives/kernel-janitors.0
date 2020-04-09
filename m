From: David Miller <davem@davemloft.net>
Date: Thu, 09 Apr 2020 17:15:29 +0000
Subject: Re: [PATCH] net-sysfs: remove redundant assignment to variable ret
Message-Id: <20200409.101529.1142140564221269589.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200409134126.417215-1-colin.king@canonical.com>
In-Reply-To: <20200409134126.417215-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  9 Apr 2020 14:41:26 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
