From: Timur Tabi <timur@codeaurora.org>
Date: Mon, 13 Feb 2017 15:43:43 +0000
Subject: Re: [patch net-next] net: qcom/emac: fix a sizeof() typo
Message-Id: <d1ca3d65-f933-f892-a28d-bff13752c9a9@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170213110021.GA17205@mwanda>
In-Reply-To: <20170213110021.GA17205@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> We had intended to say "sizeof(u32)" but the "u" is missing.
> Fortunately, sizeof(32) is also 4, so the original code still works.
>
> Fixes: c4e7beea2192 ("net: qcom/emac: add ethtool support for reading hardware registers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Timur Tabi <timur@codeaurora.org>

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
