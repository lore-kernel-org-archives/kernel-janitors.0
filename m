From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 21 Jul 2020 17:54:07 +0000
Subject: Re: [PATCH][next] phy: qualcomm: fix setting of tx_deamp_3_5db when device property read fails
Message-Id: <20200721174207.GP12965@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200721150613.416876-1-colin.king@canonical.com>
In-Reply-To: <20200721150613.416876-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Ansuel Smith <ansuelsmth@gmail.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 21-07-20, 16:06, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when reading of the device property for "qcom,tx-deamp_3_5db"
> fails the default is being assigned incorrectly to phy_dwc3->rx_eq. This
> looks like a copy-n-paste error and in fact should be assigning the
> default instead to phy_dwc3->tx_deamp_3_5db

Applied, thanks

-- 
~Vinod
