From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 18 Apr 2019 10:54:01 +0000
Subject: Re: [PATCH] NFC: st95hf: fix spelling mistake: "receieve" -> "receive"
Message-Id: <15834163-7c70-3471-01bb-ad92fba3182e@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418095756.9264-1-colin.king@canonical.com>
In-Reply-To: <20190418095756.9264-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Samuel Ortiz <sameo@linux.intel.com>, Daniel Mack <daniel@zonque.org>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/18/2019 3:27 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/nfc/st95hf/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
> index a50a95cfcfd8..d72d48243141 100644
> --- a/drivers/nfc/st95hf/core.c
> +++ b/drivers/nfc/st95hf/core.c
> @@ -327,7 +327,7 @@ static int st95hf_echo_command(struct st95hf_context *st95context)
>   					  &echo_response);
>   	if (result) {
>   		dev_err(&st95context->spicontext.spidev->dev,
> -			"err: echo response receieve error = 0x%x\n", result);
> +			"err: echo response receive error = 0x%x\n", result);
>   		return result;
>   	}
>   
