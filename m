From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 30 Jul 2018 07:35:47 +0000
Subject: Re: [PATCH -next] thermal: armada: fix return value check in armada_thermal_probe_legacy()
Message-Id: <20180730093547.5ddbdf55@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532918524-46054-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532918524-46054-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Daniel,

Daniel Lezcano <daniel.lezcano@linaro.org> wrote on Mon, 30 Jul 2018
08:18:53 +0200:

> On 30/07/2018 04:42, Wei Yongjun wrote:
> > In case of error, the function platform_get_resource() returns NULL
> > pointer not ERR_PTR(). The IS_ERR() test in the return value check
> > should be replaced with NULL test.
> > 
> > Fixes: 175637792d45 ("thermal: armada: convert driver to syscon register accesses")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---  
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> 

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

