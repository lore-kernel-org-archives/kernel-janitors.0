From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 11 May 2020 17:45:03 +0000
Subject: Re: [PATCH -next] remoteproc/mediatek: fix invalid use of sizeof in scp_ipi_init()
Message-Id: <CANLsYkxn2QAHgGtmygbw4x-kmrzo2R5u3XDmDUz5EVAYg=SQyQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509084237.36293-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509084237.36293-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel-janitors@vger.kernel.org, Erin Lo <erin.lo@mediatek.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Hulk Robot <hulkci@huawei.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Sat, 9 May 2020 at 02:38, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> sizeof() when applied to a pointer typed expression gives the
> size of the pointer, not that of the pointed data.
>
> Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 2bead57c9cf9..ac13e7b046a6 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -132,8 +132,8 @@ static int scp_ipi_init(struct mtk_scp *scp)
>                 (struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
>         scp->send_buf >                 (struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
> -       memset_io(scp->recv_buf, 0, sizeof(scp->recv_buf));
> -       memset_io(scp->send_buf, 0, sizeof(scp->send_buf));
> +       memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
> +       memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
>         return 0;
>  }
>
>
>
