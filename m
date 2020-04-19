From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Apr 2020 09:51:21 +0000
Subject: Re: [PATCH] PCI: v3-semi: Fix a memory leak in some error handling paths in 'v3_pci_probe()'
Message-Id: <CACRpkdZ347msE7ohENGw1nBLJX1zQybywKoMA8HgZ6Cc6d9Z-A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418081637.1585-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200418081637.1585-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Apr 18, 2020 at 10:16 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> IF we fails somewhere in 'v3_pci_probe()', we need to free 'host'.
> Use the managed version of 'pci_alloc_host_bridge()' to do that easily.
> The use of managed resources is already widely used in this driver.
>
> Fixes: 68a15eb7bd0c ("PCI: v3-semi: Add V3 Semiconductor PCI host driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
