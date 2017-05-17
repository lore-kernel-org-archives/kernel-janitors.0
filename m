From: Sekhar Nori <nsekhar@ti.com>
Date: Wed, 17 May 2017 09:35:06 +0000
Subject: Re: [PATCH 1/2] ARM: davinci: PM: Free resources in error handling path in 'davinci_pm_init'
Message-Id: <bec1f848-a556-3912-56b1-c239ce62ae8d@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170513114005.23617-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170513114005.23617-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Saturday 13 May 2017 05:10 PM, Christophe JAILLET wrote:
> If 'sram_alloc' fails, we need to free already allocated resources.
> 
> Fixes: aa9aa1ec2df6 ("ARM: davinci: PM: rework init, remove platform device")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to fixes for v4.12.

Thanks,
Sekhar

