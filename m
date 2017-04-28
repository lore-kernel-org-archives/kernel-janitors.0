From: walter harms <wharms@bfs.de>
Date: Fri, 28 Apr 2017 07:17:16 +0000
Subject: Re: [PATCH v4] NFC: trf7970a: Correct register settings for 27MHz clock
Message-Id: <5902EC7C.8000608@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493328526-28395-1-git-send-email-geoff@kuvee.com>
In-Reply-To: <1493328526-28395-1-git-send-email-geoff@kuvee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Just a hint for the future,
It is helpful to add a simple line to document chances
done from e.g. V1->V2

re,
 wh


Am 27.04.2017 23:28, schrieb Geoff Lansberry:
> In prior commits the selected clock frequency does not propagate
> correctly to what is written to the TRF7970A_MODULATOR_SYS_CLK_CTRL
> register.
> 
> Signed-off-by: Geoff Lansberry <geoff@kuvee.com>
> ---
>  drivers/nfc/trf7970a.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
> index 6ed5d7e..f7fee7d 100644
> --- a/drivers/nfc/trf7970a.c
> +++ b/drivers/nfc/trf7970a.c
> @@ -2067,6 +2067,13 @@ static int trf7970a_probe(struct spi_device *spi)
>  		return -EINVAL;
>  	}
>  
> +	if (clk_freq = TRF7970A_27MHZ_CLOCK_FREQUENCY) {
> +		trf->modulator_sys_clk_ctrl = TRF7970A_MODULATOR_27MHZ;
> +		dev_dbg(trf->dev, "trf7970a configured for 27MHz crystal\n");
> +	} else {
> +		trf->modulator_sys_clk_ctrl = 0;
> +	}
> +
>  	ret = devm_request_threaded_irq(trf->dev, spi->irq, NULL,
>  					trf7970a_irq,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
