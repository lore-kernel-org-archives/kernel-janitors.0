From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 03 Jun 2019 08:12:04 +0000
Subject: Re: [PATCH] mfd: stmfx: Uninitialized variable in stmfx_irq_handler()
Message-Id: <20190603081204.GG4797@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190515093141.GA3409@mwanda>
In-Reply-To: <20190515093141.GA3409@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 15 May 2019, Dan Carpenter wrote:

> The problem is that on 64bit systems then we don't clear the higher
> bits of the "pending" variable.  So when we do:
> 
> 	ack = pending & ~BIT(STMFX_REG_IRQ_SRC_EN_GPIO);
> 	if (ack) {
> 
> the if (ack) condition relies on uninitialized data.  The fix it that
> I've changed "pending" from an unsigned long to a u32.  I changed "n" as
> well, because that's a number in the 0-10 range and it fits easily
> inside an int.  We do need to add a cast to "pending" when we use it in
> the for_each_set_bit() loop, but that doesn't cause a proble, it's
> fine.
> 
> Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mfd/stmfx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Could do with an author's Ack here.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
