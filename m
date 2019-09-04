From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 04 Sep 2019 16:36:41 +0000
Subject: Re: [PATCH -next] phy: lantiq: vrx200-pcie: fix error return code in ltq_vrx200_pcie_phy_power_on()
Message-Id: <CAFBinCBo2Mf_7jXiNLoP7+t+TGVA9PmM9zT+Ni+1=q6OH1cU6A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904114014.124099-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904114014.124099-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 4, 2019 at 1:23 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: e52a632195bf ("phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for spotting and fixing this issue!
