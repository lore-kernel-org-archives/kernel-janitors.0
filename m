From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 03:40:48 +0000
Subject: Re: [PATCH net-next] dpaa2-eth: fix error return code in setup_dpni()
Message-Id: <20200430.204048.2100348364642739809.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427104322.11214-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427104322.11214-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: ioana.ciornei@nxp.com, ruxandra.radulescu@nxp.com, linux@armlinux.org.uk, ast@kernel.org, daniel@iogearbox.net, kuba@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 10:43:22 +0000

> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks.
