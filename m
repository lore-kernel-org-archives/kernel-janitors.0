From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 14 Feb 2018 14:43:34 +0000
Subject: Re: [PATCH -next] clk: samsung: exynos-audss: Remove redundant dev_err call in exynos_audss_clk_prob
Message-Id: <240b9be5-429c-ca34-63c6-bdd260970ca8@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516188378-144847-1-git-send-email-weiyongjun1@huawei.com>
 <CGME20180214144350epcas1p1d66e605e6d68de23661f51ced410d72e@epcas1p1.samsung.com>
In-Reply-To: <1516188378-144847-1-git-send-email-weiyongjun1@huawei.com>
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
