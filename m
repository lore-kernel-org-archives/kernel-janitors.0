From: Tony Lindgren <tony@atomide.com>
Date: Fri, 12 Apr 2019 15:43:49 +0000
Subject: Re: [PATCH -next] bus: ti-sysc: Use PTR_ERR_OR_ZERO in sysc_init_resets()
Message-Id: <20190412154349.GX2839@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190411024708.123605-1-yuehaibing@huawei.com>
In-Reply-To: <20190411024708.123605-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Faiz Abbas <faiz_abbas@ti.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

* YueHaibing <yuehaibing@huawei.com> [190411 02:36]:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Thanks but I'll rather skip this one as I find it a bit hard
to read unless there's some reasoning other than compress
few lines out of the code.

Regards,

TOny
