From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sun, 19 Jan 2020 17:50:09 +0000
Subject: Re: [PATCH -next] PCI: brcmstb: Fix missing mutex_init()
Message-Id: <f49226ca-6256-3709-3f7a-8996f5e68d76@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200119023003.100987-1-weiyongjun1@huawei.com>
In-Reply-To: <20200119023003.100987-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org



On 1/18/2020 6:30 PM, Wei Yongjun wrote:
> The driver allocates the mutex but not initialize it.
> Use mutex_init() on it to initialize it correctly.
> 
> This is detected by Coccinelle semantic patch.
> 
> Fixes: 72af6f6f0d13 ("PCI: brcmstb: Add MSI support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
