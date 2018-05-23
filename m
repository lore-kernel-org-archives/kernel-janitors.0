From: Baolin Wang <baolin.wang@linaro.org>
Date: Wed, 23 May 2018 01:57:29 +0000
Subject: Re: [PATCH -next] dmaengine: sprd: Fix return value check in sprd_dma_probe()
Message-Id: <CAMz4kuLcEXZyCGdXY8uq7tawkArQ5w5bmJctNehG8yjo1gDFWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1526989708-140048-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1526989708-140048-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 22 May 2018 at 19:48, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Fixes: e7f063ae1a31 ("dmaengine: sprd: Use devm_ioremap_resource() to map=
 memory")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, but we already had a fix for this issue:
https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/slave-dma.git/commit/=
?h=3Dtopic/sprd&id=FD8d26adc9a909c0c099265cb62d5e5ec2a87e7e

--=20
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
