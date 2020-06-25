From: Igor Russkikh <irusskikh@marvell.com>
Date: Thu, 25 Jun 2020 17:00:13 +0000
Subject: Re: [EXT] [PATCH][V2] qed: add missing error test for DBG_STATUS_NO_MATCHING_FRAMING_MODE
Message-Id: <e113ec71-64ea-b819-9103-4008d20188c2@marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200625164505.115425-1-colin.king@canonical.com>
In-Reply-To: <20200625164505.115425-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2 <GR-everest-linux-l2@marvell.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Michal Kalderon <mkalderon@marvell.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 25/06/2020 7:45 pm, Colin King wrote:
> External Email
> 
> ----------------------------------------------------------------------
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
> 
> ---

Thanks!

Acked-by: Igor Russkikh <irusskikh@marvell.com>
