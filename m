From: David Miller <davem@davemloft.net>
Date: Wed, 25 Apr 2018 18:12:42 +0000
Subject: Re: [PATCH] mkiss: remove redundant check for len > 0
Message-Id: <20180425.141242.356107204003495124.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180425104307.8310-1-colin.king@canonical.com>
In-Reply-To: <20180425104307.8310-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: johannes.berg@intel.com, stephen@networkplumber.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Apr 2018 11:43:07 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for len > 0 is always true and hence is redundant as
> this check is already being made to execute the code inside the
> while-loop. Hence it is redundant and can be removed.
> 
> Cleans up cppcheck warning:
> drivers/net/hamradio/mkiss.c:220: (warning) Identical inner 'if'
> condition is always true.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
