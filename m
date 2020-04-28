From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Apr 2020 17:23:48 +0000
Subject: Re: [PATCH -next] PCI: dwc: pci-dra7xx: Fix potential NULL dereference in dra7xx_pcie_probe()
Message-Id: <20200428172348.GH2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111044.162618-1-weiyongjun1@huawei.com>
 <cad871c8-0915-9dda-2c61-30dfb5504d23@ti.com>
 <20200428130734.GF2014@kadam>
 <ebb4db96-08ef-64fe-5331-291f054562ed@ti.com>
In-Reply-To: <ebb4db96-08ef-64fe-5331-291f054562ed@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

Oh.  Crap.  I'm sorry.  I misread the code.

regards,
dan carpenter
