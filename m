From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Thu, 22 Mar 2018 02:49:46 +0000
Subject: Re: [PATCH][next] phy: qcom-qusb2: fix missing assignment to an error return code
Message-Id: <40d4e9a6-86c0-4f1d-4768-b27209ab4890@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321174538.2194-1-colin.king@canonical.com>
In-Reply-To: <20180321174538.2194-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 3/21/2018 11:15 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The error return code is not being assigned to ret from the call
> to clk_prepare_enable and consequently the current check on ret
> picks up the previous error return. Fix this by adding in the
> missing assignment to ret.
>
> Detected by CoverityScan, CID#166020 ("Logically Dead code")
>
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM)
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Vivek Gautam <vivek.gautam@codeaurora.org>

regards
Vivek

>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 94afeac1a19e..6f5689a40884 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -439,7 +439,7 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
>   	}
>   
>   	if (!qphy->has_se_clk_scheme) {
> -		clk_prepare_enable(qphy->ref_clk);
> +		ret = clk_prepare_enable(qphy->ref_clk);
>   		if (ret) {
>   			dev_err(dev, "failed to enable ref clk, %d\n", ret);
>   			goto disable_ahb_clk;

