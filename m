From: Lars-Peter Clausen <lars@metafoo.de>
Date: Mon, 20 Feb 2017 08:35:04 +0000
Subject: Re: [PATCH] iio: adc: xilinx: Fix error handling
Message-Id: <880c338e-7e81-83c7-613a-d8030c14bac0@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219202928.20296-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170219202928.20296-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 02/19/2017 09:29 PM, Christophe JAILLET wrote:
> Reorder error handling labels in order to match the way resources have
> been allocated.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, looks good.

Acked-by: Lars-Peter Clausen <lars@metafoo.de>

I think there is one more issue

    ret = xadc->ops->setup(pdev, indio_dev, irq);
    if (ret)
        goto err_free_samplerate_trigger;

should be

	goto err_clk_disable_unprepare;

