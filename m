From: David Miller <davem@davemloft.net>
Date: Thu, 14 Sep 2017 17:00:41 +0000
Subject: Re: [PATCH] tg3: clean up redundant initialization of tnapi
Message-Id: <20170914.100041.1507992015904111255.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170914160125.11007-1-colin.king@canonical.com>
In-Reply-To: <20170914160125.11007-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: siva.kallam@broadcom.com, prashant@broadcom.com, mchan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Sep 2017 17:01:25 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> tnapi is being initialized and then immediately updated and
> hence the initialiation is redundant.  Clean up the warning
> by moving the declaration and initialization to the inside
> of the for-loop.
> 
> Cleans up clang scan-build warning:
> warning: Value stored to 'tnapi' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
