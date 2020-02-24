From: Robert Richter <rrichter@marvell.com>
Date: Mon, 24 Feb 2020 10:26:31 +0000
Subject: Re: [PATCH] MAINTAINERS: clean up PCIE DRIVER FOR CAVIUM THUNDERX
Message-Id: <20200224102631.c5yluo6u5ipghyz4@rric.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200223090950.5259-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200223090950.5259-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Andrew Murray <andrew.murray@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org

Hi Lukas,

On 23.02.20 10:09:50, Lukas Bulwahn wrote:
> Commit e1ac611f57c9 ("dt-bindings: PCI: Convert generic host binding to
> DT schema") combines all information from pci-thunder-{pem,ecam}.txt
> into host-generic-pci.yaml, and deleted the two files in
> Documentation/devicetree/bindings/pci/.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   no file matches F: Documentation/devicetree/bindings/pci/pci-thunder-*
> 
> As the PCIE DRIVER FOR CAVIUM THUNDERX-relevant information is only a
> small part of the host-generic-pci.yaml, do not add this file to the
> PCIE DRIVER FOR CAVIUM THUNDERX entry, and only drop the reference to
> the removed files.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Robert Richter <rrichter@marvell.com>

> ---
> Robert, are you still the maintainer of this driver?

Sure. I inherited the driver a couple of months ago from David who is
no longer at Cavium/ Marvell.

Thanks,

-Robert
