From: Kalle Valo <kvalo@codeaurora.org>
Date: Sun, 26 Jan 2020 10:51:41 +0000
Subject: Re: [PATCH v2] ath11k: fix up some error paths
Message-Id: <20200126105141.F0F6DC433CB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115174652.dvkmznhfvjaoc47l@kili.mountain>
In-Reply-To: <20200115174652.dvkmznhfvjaoc47l@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, John Crispin <john@phrozen.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>, Bhagavathi Perumal S <bperumal@codeaurora.org>

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There are two error paths where "ret" wasn't set.  Also one error path
> we set the error code to -EINVAL but we should just preserve the error
> code from ath11k_hal_srng_get_entrysize().  That function only returns
> -EINVAL so this doesn't change anything.
> 
> I removed the "ret = 0;" initializers so that hopefully GCC will be able
> to detect these sorts of bugs in the future.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7195c8747e87 ath11k: fix up some error paths

-- 
https://patchwork.kernel.org/patch/11335489/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
