From: David Miller <davem@davemloft.net>
Date: Tue, 09 Jan 2018 16:41:04 +0000
Subject: Re: [PATCH] be2net: use ARRAY_SIZE for array sizing calculation on array cmd_priv_map
Message-Id: <20180109.114104.322403386547644990.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180107234508.8221-1-colin.king@canonical.com>
In-Reply-To: <20180107234508.8221-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: sathya.perla@broadcom.com, ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com, somnath.kotur@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  7 Jan 2018 23:45:08 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Use the ARRAY_SIZE macro on array cmd_priv_map to determine size of the
> array.  Improvement suggested by coccinelle.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
