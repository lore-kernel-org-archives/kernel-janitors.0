From: Ian Abbott <abbotti@mev.co.uk>
Date: Sat, 06 Apr 2019 10:13:37 +0000
Subject: Re: [PATCH -next] staging: comedi: dyna_pci10xx: remove set but not used variables 'chan' and range'
Message-Id: <d35e91a5-d427-96ba-d164-33adb4ca73e2@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406030749.56659-1-yuehaibing@huawei.com>
In-Reply-To: <20190406030749.56659-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sanjana Sanikommu <sanjana99reddy99@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/04/2019 04:07, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/staging/comedi/drivers/dyna_pci10xx.c: In function 'dyna_pci10xx_insn_write_ao':
> drivers/staging/comedi/drivers/dyna_pci10xx.c:109:21: warning:
>   variable 'range' set but not used [-Wunused-but-set-variable]
>    unsigned int chan, range;
> 
> drivers/staging/comedi/drivers/dyna_pci10xx.c:109:15: warning:
>   variable 'chan' set but not used [-Wunused-but-set-variable]
>    unsigned int chan, range;
> 
> They are never used since introduction in commit 16a7373a8e14 ("Staging:
> comedi: add dyna_pci10xx driver")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/staging/comedi/drivers/dyna_pci10xx.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/dyna_pci10xx.c b/drivers/staging/comedi/drivers/dyna_pci10xx.c
> index 9bdd5bf2eb99..d38bfc6113e8 100644
> --- a/drivers/staging/comedi/drivers/dyna_pci10xx.c
> +++ b/drivers/staging/comedi/drivers/dyna_pci10xx.c
> @@ -106,10 +106,6 @@ static int dyna_pci10xx_insn_write_ao(struct comedi_device *dev,
>   {
>   	struct dyna_pci10xx_private *devpriv = dev->private;
>   	int n;
> -	unsigned int chan, range;
> -
> -	chan = CR_CHAN(insn->chanspec);
> -	range = range_codes_pci1050_ai[CR_RANGE((insn->chanspec))];
>   
>   	mutex_lock(&devpriv->mutex);
>   	for (n = 0; n < insn->n; n++) {

That seems fine, thanks.  The lines being removed appear to have been 
copy and pasted from dyna_pci10xx_insn_read_ai().  The AO subdevice 
supports a single range, so no 'range' code is needed.  I believe the 
card has only one analog output channel[*], so the 'chan' is irrelevant. 
  This means the 'n_chans' value in the AO subdevice configuration is 
incorrect.  I'll send a follow-up patch to correct that after Greg KH 
takes this one.

[*] Very little information seems to be available about this card 
online.  It is no longer listed on the manufacturer's web-site and I 
couldn't find any archives on archive.org.  I found part of a scientific 
paper
<http://shodhganga.inflibnet.ac.in/bitstream/10603/150646/15/15_chapter%205.pdf>
which describes the card as having a single channel D/A converter.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
