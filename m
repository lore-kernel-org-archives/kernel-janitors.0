From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 14 Feb 2018 14:45:05 +0000
Subject: Re: [PATCH -next] clk: samsung: exynos5433: Remove redundant dev_err call in exynos5433_cmu_probe()
Message-Id: <a819f423-a283-b30c-b088-b865cea3e6ec@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516188387-144930-1-git-send-email-weiyongjun1@huawei.com>
 <CGME20180214144511epcas1p2d950632022f7fbc07151959fc6a43701@epcas1p2.samsung.com>
In-Reply-To: <1516188387-144930-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 01/17/2018 12:26 PM, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied, thanks.
