From: David Miller <davem@davemloft.net>
Date: Thu, 22 Aug 2019 23:23:39 +0000
Subject: Re: [PATCH] ethernet: Delete unnecessary checks before the macro call =?iso-2022-jp?B?GyRCIUgbKEJkZX
Message-Id: <20190822.162339.831735149510227752.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
In-Reply-To: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus.Elfring@web.de
Cc: kstewart@linuxfoundation.org, michael.heimpold@i2se.com, kernel-janitors@vger.kernel.org, wsa+renesas@sang-engineering.com, weiyongjun1@huawei.com, opensource@jilayne.com, linux-stm32@st-md-mailman.stormreply.com, stefan.wahren@i2se.com, opendmb@gmail.com, yuehaibing@huawei.com, joabreu@synopsys.com, intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, ynezz@true.cz, bryan.whitehead@microchip.com, jeffrey.t.kirsher@intel.com, alexandre.torgue@st.com, jonathan.lemon@gmail.com, yang.wei9@zte.com.cn, alexios.zavras@intel.com, claudiu.manoil@nxp.com, f.fainelli@gmail.com, swinslow@gmail.com, shannon.nelson@oracle.com, peppe.cavallaro@st.com, tglx@linutronix.de, zhongjiang@huawei.com, allison@lohutok.net, nico@fluxnic.net, gregkh@linuxfoundation.org, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, mcgrof@kernel.org, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org

From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 20:30:15 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 22 Aug 2019 20:02:56 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
