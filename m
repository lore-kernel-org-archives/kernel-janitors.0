From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Aug 2017 11:53:30 +0000
Subject: Re: [PATCH] staging: pi433: remove some macros, introduce some inline functions
Message-Id: <20170802115330.uvvzqrimbz2ixoyk@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee876334d7eb4af0d2277d0b9a61fdb6-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQDVFE=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
In-Reply-To: <ee876334d7eb4af0d2277d0b9a61fdb6-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQDVFE=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolf Entwicklungen <Marcus.Wolf@Wolf-Entwicklungen.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

I'm afraid this patch is going to need to be divided into several
patches that do one thing per patch.  And I totally get that redoing
patches sucks...  Sorry.

On Wed, Aug 02, 2017 at 01:10:14PM +0200, Wolf Entwicklungen wrote:
> According to the proposal of Walter Harms, I removed some macros
> and added some inline functions.
> 
> Since I used a bit more intelligent interface, this enhances
> readability and reduces problems with checkpatch.pl at the same time.
> 
> In addition obsolete debug ifdefs were removed.
> 
> Signed-off-by: Marcus Wolf <linux@wolf-entwicklungen.de>
> ---
>  drivers/staging/pi433/rf69.c |  544 ++++++++++++++++++------------------------
>  1 file changed, 238 insertions(+), 306 deletions(-)
> 
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -28,33 +28,57 @@
>  #include "rf69.h"
>  #include "rf69_registers.h"
> 
> -#define F_OSC	  32000000 /* in Hz */
> -#define FIFO_SIZE 66 	   /* in byte */
> +#define F_OSC 32000000 /* in Hz */
> +#define FIFO_SIZE 66   /* in byte */


These are unrelated white space changes so they'll need to go in a
separate patch.

> 
>  /*-------------------------------------------------------------------------*/
> 
> -#define READ_REG(x)	rf69_read_reg (spi, x)
> -#define WRITE_REG(x,y)	rf69_write_reg(spi, x, y)
>  #define INVALID_PARAM \
>  	{ \
>  		dev_dbg(&spi->dev, "set: illegal input param"); \
>  		return -EINVAL; \
>  	}
> 
> +inline static int setBit(struct spi_device *spi, u8 reg, u8 mask)

Don't put "inline" on functions, let the compiler decide.  setBit is
camel case and also the name is probably too generic.  Add a prefix so
it's rf69_set_bits().


> +{
> +	u8 tempVal;

Camel case.

> +
> +	tempVal = rf69_read_reg (spi, reg);

No space before the '(' char.

> +	tempVal = tempVal | mask;
> +	return rf69_write_reg(spi, reg, tempVal);
> +}
> +
> +inline static int rstBit(struct spi_device *spi, u8 reg, u8 mask)

Maybe clear_bits is better than reset_bit.

> +{
> +	u8 tempVal;
> +
> +	tempVal = rf69_read_reg (spi, reg);
> +	tempVal = tempVal & ~mask;
> +	return rf69_write_reg(spi, reg, tempVal);
> +}
> +
> +inline static int rmw(struct spi_device *spi, u8 reg, u8 mask, u8 value)

What does rmw mean?  Maybe just full words here or add a comment.  I
guess read_modify_write is too long...


> +{
> +	u8 tempVal;
> +
> +	tempVal = rf69_read_reg (spi, reg);
> +	tempVal = (tempVal & ~mask) | value;
> +	return rf69_write_reg(spi, reg, tempVal);
> +}
> +
>  /*-------------------------------------------------------------------------*/
> 
>  int rf69_set_mode(struct spi_device *spi, enum mode mode)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: mode");
> -	#endif
> 
> +	dev_dbg(&spi->dev, "set: mode");

This change is unrelated.  Also just delete the line, because we can
get the same information use ftrace instead.

Anyway, I glanced through the rest of the patch and I think probably
it should be broken up like this:

[patch 1] add rf69_rmw() and convert callers
[patch 2] add rf69_set_bit and rf69_clear_bit() and convert callers
[patch 3] convert remaining callers to use rf69_read_reg() directly
[patch 4] get rid of #ifdef debug, deleting code as appropriate
[patch 5] other white space changes

Greg is going to apply patches as they arrive on the email list, first
come, first served.  The problem is that some patches might have
problems so you kind of have to guess which are good patches that he
will apply and which are bad an then write your patch on top of that.

Normally, I just write my patch based on linux-next and hope for the
best.  If I have to redo it because of conflicts, that's just part of
the process.  But my patches are normally small so they don't often
conflict.

regards,
dan carpenter

