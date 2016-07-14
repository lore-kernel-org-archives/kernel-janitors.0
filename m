From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Thu, 14 Jul 2016 13:12:49 +0000
Subject: Re: [PATCH] PCI: xilinx: Fix return value in case of error
Message-Id: <20160714131249.GJ3847@xsjsorenbubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468491046-1427-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1468491046-1427-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

On Thu, 2016-07-14 at 12:10:46 +0200, Christophe JAILLET wrote:
> In function 'xilinx_pcie_init_irq_domain', the pattern used to check and
> return error is:
> 
>    if (!var) {
>       dev_err(...);
>       return PTR_ERR(var);
>    }
> 
> So the returned value in case of error is always 0, which means 'success'.
> Change it to return -ENODEV instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>

	Sören
