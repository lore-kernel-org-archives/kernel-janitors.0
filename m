From: Ian Abbott <abbotti@mev.co.uk>
Date: Tue, 05 Jun 2018 10:06:59 +0000
Subject: Re: [PATCH] staging: comedi: quatech_daqp_cs: fix no-op loop daqp_ao_insn_write()
Message-Id: <b17dd99c-2b0f-4fc3-9d82-69367d0e0574@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 05/06/18 10:36, Dan Carpenter wrote:
> There is a '>' vs '<' typo so this loop is a no-op.
> 
> Fixes: d35dcc89fc93 ("staging: comedi: quatech_daqp_cs: fix daqp_ao_insn_write()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
> index ea194aa01a64..257b0daff01f 100644
> --- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
> +++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
> @@ -642,7 +642,7 @@ static int daqp_ao_insn_write(struct comedi_device *dev,
>   	/* Make sure D/A update mode is direct update */
>   	outb(0, dev->iobase + DAQP_AUX_REG);
>   
> -	for (i = 0; i > insn->n; i++) {
> +	for (i = 0; i < insn->n; i++) {
>   		unsigned int val = data[i];
>   		int ret;
>   
> 

Thanks for catching that bug!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
