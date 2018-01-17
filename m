From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 17 Jan 2018 11:36:30 +0000
Subject: Re: [PATCH -next] media: rcar_drif: fix error return code in rcar_drif_alloc_dmachannels()
Message-Id: <383f2b67-69a2-3491-f85d-d3bc0b25f6e8@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516188292-144008-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516188292-144008-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello!

On 01/17/2018 02:24 PM, Wei Yongjun wrote:

> Fix to return error code -ENODEV from the dma_request_slave_channel()
> error handling case instead of 0, as done elsewhere in this function.
> rc can be overwrite to 0 by dmaengine_slave_config() in the for loop.

    Overwritten.

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
[...]

MBR, Sergei
