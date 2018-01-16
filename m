From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 16 Jan 2018 17:06:01 +0000
Subject: Re: [PATCH] bnxt_en: don't update cpr->rx_bytes with uninitialized length len
Message-Id: <CACKFLikYfUSPwSpO158naP0KiSsGpE_Xey_EA7tcpibvAfOi7Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116102250.22914-1-colin.king@canonical.com>
In-Reply-To: <20180116102250.22914-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Netdev <netdev@vger.kernel.org>, Andrew Gospodarek <andrew.gospodarek@broadcom.com>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Tue, Jan 16, 2018 at 2:22 AM, Colin King <colin.king@canonical.com> wrote:
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
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks.

Acked-by: Michael Chan <michael.chan@broadcom.com>
