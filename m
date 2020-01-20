From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Mon, 20 Jan 2020 10:54:47 +0000
Subject: Re: [PATCH -next] PCI: brcmstb: Fix missing mutex_init()
Message-Id: <20200120105447.GA17089@e121166-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200119023003.100987-1-weiyongjun1@huawei.com>
 <f49226ca-6256-3709-3f7a-8996f5e68d76@gmail.com>
In-Reply-To: <f49226ca-6256-3709-3f7a-8996f5e68d76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, Jim Quinlan <james.quinlan@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Helgaas <bhelgaas@google.com>, Andrew Murray <andrew.murray@arm.com>, linux-arm-kernel@lists.infradead.org

On Sun, Jan 19, 2020 at 09:50:09AM -0800, Florian Fainelli wrote:
> 
> 
> On 1/18/2020 6:30 PM, Wei Yongjun wrote:
> > The driver allocates the mutex but not initialize it.
> > Use mutex_init() on it to initialize it correctly.
> > 
> > This is detected by Coccinelle semantic patch.
> > 
> > Fixes: 72af6f6f0d13 ("PCI: brcmstb: Add MSI support")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

I have squashed it in in my pci/brcmstb branch, thanks.

Lorenzo
