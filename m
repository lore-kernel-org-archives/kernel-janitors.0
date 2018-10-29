From: Shawn Guo <shawn.guo@linaro.org>
Date: Mon, 29 Oct 2018 02:00:00 +0000
Subject: Re: [PATCH] PCI: histb: constify dw_pcie_host_ops structure
Message-Id: <CAAQ0ZWRXUotcf5u3CAnic=RqKOhVy2irQQw4jZHr_L5fYDZwVg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540665079-27788-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540665079-27788-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: sunjianguo1 <sunjianguo1@huawei.com>, kernel-janitors@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Oct 28, 2018 at 3:06 AM Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>
> The dw_pcie_host_ops structure is only stored in the ops field
> of a pcie_port structure, and this field is const, so make the
> dw_pcie_host_ops structure const as well.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
