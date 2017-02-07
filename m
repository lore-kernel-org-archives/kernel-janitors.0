From: David Miller <davem@davemloft.net>
Date: Tue, 07 Feb 2017 19:05:01 +0000
Subject: Re: [PATCH][net-next] net: bridge: remove redundant check to see if err is set
Message-Id: <20170207.140501.318284472850132434.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207105638.17918-1-colin.king@canonical.com>
In-Reply-To: <20170207105638.17918-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: stephen@networkplumber.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  7 Feb 2017 10:56:38 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The error check on err is redundant as it is being checked
> previously each time it has been updated.  Remove this redundant
> check.
> 
> Detected with CoverityScan, CID#140030("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
