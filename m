From: David Miller <davem@davemloft.net>
Date: Thu, 27 Sep 2018 03:10:21 +0000
Subject: Re: [PATCH][V2] wimax/i2400m: fix spelling mistake "not unitialized" -> "uninitialized"
Message-Id: <20180926.201021.56420855924083408.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180924173951.3931-1-colin.king@canonical.com>
In-Reply-To: <20180924173951.3931-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: inaky.perez-gonzalez@intel.com, linux-wimax@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Sep 2018 18:39:51 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in ms_to_errno array of error messages
> and remove confusing "not" from the error text since the error code
> refers to an uninitialized error code.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: remove "not" from text too. Thanks to Sergei Shtylyov for spotting that.

Applied.
