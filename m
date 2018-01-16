From: David Miller <davem@davemloft.net>
Date: Tue, 16 Jan 2018 20:24:53 +0000
Subject: Re: [PATCH] bnxt_en: don't update cpr->rx_bytes with uninitialized length len
Message-Id: <20180116.152453.1072329036192883739.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116102250.22914-1-colin.king@canonical.com>
In-Reply-To: <20180116102250.22914-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: michael.chan@broadcom.com, netdev@vger.kernel.org, andrew.gospodarek@broadcom.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jan 2018 10:22:50 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently in the cases where cmp_type = CMP_TYPE_RX_L2_TPA_START_CMP or
> CMP_TYPE_RX_L2_TPA_END_CMP the exit path updates cpr->rx_bytes with an
> uninitialized length len.  Fix this by adding a new exit path that does
> not update the cpr stats with the bogus length len and remove the unused
> label next_rx_no_prod.
> 
> Detected by CoverityScan, CID#1463807 ("Uninitialized scalar variable")
> Fixes: 6a8788f25625 ("bnxt_en: add support for software dynamic interrupt moderation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
