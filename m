From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 26 Nov 2018 08:24:38 +0000
Subject: Re: [PATCH] ath10k: fix a NULL vs IS_ERR() check
Message-Id: <8736rob60p.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126081143.tvu55aimdc3safcq@kili.mountain>
In-Reply-To: <20181126081143.tvu55aimdc3safcq@kili.mountain> (Dan Carpenter's
 message of "Mon, 26 Nov 2018 11:11:43 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The devm_memremap() function doesn't return NULLs, it returns error
> pointers.
>
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index f0429bee35c2..37b3bd629f48 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -931,9 +931,9 @@ static int ath10k_qmi_setup_msa_resources(struct ath10k_qmi *qmi, u32 msa_size)
>  		qmi->msa_mem_size = resource_size(&r);
>  		qmi->msa_va = devm_memremap(dev, qmi->msa_pa, qmi->msa_mem_size,
>  					    MEMREMAP_WT);
> -		if (!qmi->msa_va) {
> +		if (IS_ERR(qmi->msa_va)) {
>  			dev_err(dev, "failed to map memory region: %pa\n", &r.start);
> -			return -EBUSY;
> +			return PTR_ERR(qmi->msa_va);

That's a very good find!

But how has this even worked before? I would assume devm_memremap()
always returns a non-NULL value and ath10k would have interpreted that
as an error?

-- 
Kalle Valo
