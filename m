From: David Miller <davem@davemloft.net>
Date: Thu, 25 Jun 2020 19:48:33 +0000
Subject: Re: [PATCH][V2] qed: add missing error test for DBG_STATUS_NO_MATCHING_FRAMING_MODE
Message-Id: <20200625.124833.893666125631041346.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200625164505.115425-1-colin.king@canonical.com>
In-Reply-To: <20200625164505.115425-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aelior@marvell.com, GR-everest-linux-l2@marvell.com, kuba@kernel.org, michal.kalderon@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, irusskikh@marvell.com

From: Colin King <colin.king@canonical.com>
Date: Thu, 25 Jun 2020 17:45:05 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The error DBG_STATUS_NO_MATCHING_FRAMING_MODE was added to the enum
> enum dbg_status however there is a missing corresponding entry for
> this in the array s_status_str. This causes an out-of-bounds read when
> indexing into the last entry of s_status_str.  Fix this by adding in
> the missing entry.
> 
> Addresses-Coverity: ("Out-of-bounds read").
> Fixes: 2d22bc8354b1 ("qed: FW 8.42.2.0 debug features")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: use the error message as suggested by Igor Russkikh

I already applied your V1 so this patch no longer applies.
