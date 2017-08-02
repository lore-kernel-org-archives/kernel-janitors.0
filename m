From: "Wolf Entwicklungen" <Marcus.Wolf@Wolf-Entwicklungen.de>
Date: Wed, 02 Aug 2017 11:14:15 +0000
Subject: Re: [PATCH] staging: pi433: remove some macros, introduce some inline functions
Message-Id: <b63fae1f2e2a0a1454003735be0002eb-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQFUFA=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee876334d7eb4af0d2277d0b9a61fdb6-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQDVFE=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
In-Reply-To: <ee876334d7eb4af0d2277d0b9a61fdb6-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQDVFE=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus.Wolf@Wolf-Entwicklungen.de
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dan,

as discussed last week, here you can find my patch, touching
nearly every function in rf69.c

I tried my best to have a correct style of the patch.

As far, as I figured out, the patch does not fully apply on
staging-next, since there are two bugfixes missing, that
were reported before (my patch, concerning the bit shifting,
we talked about last week and an other patch fixing an issue
with a bit inversion).

Hope it helps :-)

Marcus


Am Mi, 2.08.2017, 13:10 schrieb Wolf Entwicklungen:
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
> +{
> +	u8 tempVal;
> +
> +	tempVal = rf69_read_reg (spi, reg);
> +	tempVal = tempVal | mask;
> +	return rf69_write_reg(spi, reg, tempVal);
> +}
> +
> +inline static int rstBit(struct spi_device *spi, u8 reg, u8 mask)
> +{
> +	u8 tempVal;
> +
> +	tempVal = rf69_read_reg (spi, reg);
> +	tempVal = tempVal & ~mask;
> +	return rf69_write_reg(spi, reg, tempVal);
> +}
> +
> +inline static int rmw(struct spi_device *spi, u8 reg, u8 mask, u8 value)
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
> +
>  	switch (mode){
> -	case transmit:	  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_TRANSMIT);
> -	case receive:	  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_RECEIVE);
> -	case synthesizer: return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_SYNTHESIZER);
> -	case standby:	  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_STANDBY);
> -	case mode_sleep:  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_SLEEP);
> +	case transmit:	  return rmw(spi, REG_OPMODE, MASK_OPMODE_MODE, OPMODE_MODE_TRANSMIT);
> +	case receive:	  return rmw(spi, REG_OPMODE, MASK_OPMODE_MODE, OPMODE_MODE_RECEIVE);
> +	case synthesizer: return rmw(spi, REG_OPMODE, MASK_OPMODE_MODE, OPMODE_MODE_SYNTHESIZER);
> +	case standby:	  return rmw(spi, REG_OPMODE, MASK_OPMODE_MODE, OPMODE_MODE_STANDBY);
> +	case mode_sleep:  return rmw(spi, REG_OPMODE, MASK_OPMODE_MODE, OPMODE_MODE_SLEEP);
>  	default:	  INVALID_PARAM;
>  	}
>
> @@ -66,28 +90,26 @@
>
>  int rf69_set_data_mode(struct spi_device *spi, enum dataMode dataMode)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: data mode");
> -	#endif
>
> +	dev_dbg(&spi->dev, "set: data mode");
> +
>  	switch (dataMode) {
> -	case packet:		return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_PACKET);
> -	case continuous:	return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_CONTINUOUS);
> -	case continuousNoSync:  return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_CONTINUOUS_NOSYNC);
> +	case packet:		return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODE, DATAMODUL_MODE_PACKET);
> +	case continuous:	return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODE, DATAMODUL_MODE_CONTINUOUS);
> +	case continuousNoSync:  return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODE, DATAMODUL_MODE_CONTINUOUS_NOSYNC);
>  	default:		INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_modulation(struct spi_device *spi, enum modulation modulation)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: modulation");
> -	#endif
>
> +	dev_dbg(&spi->dev, "set: modulation");
> +
>  	switch (modulation) {
> -	case OOK:   return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION_TYPE_OOK);
> -	case FSK:   return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION_TYPE_FSK);
> -	default:    INVALID_PARAM;
> +	case OOK: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_TYPE, DATAMODUL_MODULATION_TYPE_OOK);
> +	case FSK: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_TYPE, DATAMODUL_MODULATION_TYPE_FSK);
> +	default:  INVALID_PARAM;
>  	}
>  }
>
> @@ -95,11 +117,9 @@
>  {
>  	u8 currentValue;
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "get: mode");
> -	#endif
> +	dev_dbg(&spi->dev, "get: mode");
>
> -	currentValue = READ_REG(REG_DATAMODUL);
> +	currentValue = rf69_read_reg(spi, REG_DATAMODUL);
>
>  	switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE)
>  	{
> @@ -111,26 +131,25 @@
>
>  int rf69_set_modulation_shaping(struct spi_device *spi, enum modShaping modShaping)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: mod shaping");
> -	#endif
>
> +	dev_dbg(&spi->dev, "set: mod shaping");
> +
>  	if (rf69_get_modulation(spi) = FSK)
>  	{
>  		switch (modShaping) {
> -		case shapingOff: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_NONE);
> -		case shaping1_0: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_1_0);
> -		case shaping0_5: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_0_3);
> -		case shaping0_3: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_0_5);
> +		case shapingOff: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_SHAPE, DATAMODUL_MODULATION_SHAPE_NONE);
> +		case shaping1_0: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_SHAPE, DATAMODUL_MODULATION_SHAPE_1_0);
> +		case shaping0_5: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_SHAPE, DATAMODUL_MODULATION_SHAPE_0_3);
> +		case shaping0_3: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_SHAPE, DATAMODUL_MODULATION_SHAPE_0_5);
>  		default:	 INVALID_PARAM;
>  		}
>  	}
>  	else
>  	{
>  		switch (modShaping) {
> -		case shapingOff: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_NONE);
> -		case shapingBR:	 return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_BR);
> -		case shaping2BR: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_2BR);
> +		case shapingOff: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_SHAPE, DATAMODUL_MODULATION_SHAPE_NONE);
> +		case shapingBR:	 return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_SHAPE, DATAMODUL_MODULATION_SHAPE_BR);
> +		case shaping2BR: return rmw(spi, REG_DATAMODUL, MASK_DATAMODUL_MODULATION_SHAPE, DATAMODUL_MODULATION_SHAPE_2BR);
>  		default:	 INVALID_PARAM;
>  		}
>  	}
> @@ -144,17 +163,12 @@
>  	u8 msb;
>  	u8 lsb;
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: bit rate");
> -	#endif
> +	dev_dbg(&spi->dev, "set: bit rate");
>
>  	// check input value
>  	bitRate_min = F_OSC / 8388608; // 8388608 = 2^23;
>  	if (bitRate < bitRate_min)
> -	{
> -		dev_dbg(&spi->dev, "setBitRate: illegal input param");
>  		INVALID_PARAM;
> -	}
>
>  	// calculate reg settings
>  	bitRate_reg = (F_OSC / bitRate);
> @@ -163,9 +177,9 @@
>  	lsb = (bitRate_reg&0xff);
>
>  	// transmit to RF 69
> -	retval = WRITE_REG(REG_BITRATE_MSB, msb);
> +	retval = rf69_write_reg(spi, REG_BITRATE_MSB, msb);
>  	if (retval)  return retval;
> -	retval = WRITE_REG(REG_BITRATE_LSB, lsb);
> +	retval = rf69_write_reg(spi, REG_BITRATE_LSB, lsb);
>  	if (retval)  return retval;
>
>  	return 0;
> @@ -181,15 +195,10 @@
>  	u8 lsb;
>  	u64 factor = 1000000; // to improve precision of calculation
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: deviation");
> -	#endif
> +	dev_dbg(&spi->dev, "set: deviation");
>
>  	if (deviation < 600 || deviation > 500000) //TODO: Abh\E4ngigkeit von Bitrate beachten!!
> -	{
> -		dev_dbg(&spi->dev, "set_deviation: illegal input param");
>  		INVALID_PARAM;
> -	}
>
>  	// calculat f step
>  	f_step = F_OSC * factor;
> @@ -206,13 +215,13 @@
>  	if (msb & ~FDEVMASB_MASK)
>  	{
>  		dev_dbg(&spi->dev, "set_deviation: err in calc of msb");
> -		INVALID_PARAM;
> +		return -EINVAL;
>  	}
>
>  	// write to chip
> -	retval = WRITE_REG(REG_FDEV_MSB, msb);
> +	retval = rf69_write_reg(spi, REG_FDEV_MSB, msb);
>  	if (retval)  return retval;
> -	retval = WRITE_REG(REG_FDEV_LSB, lsb);
> +	retval = rf69_write_reg(spi, REG_FDEV_LSB, lsb);
>  	if (retval)  return retval;
>
>  	return 0;
> @@ -229,9 +238,7 @@
>  	u8 lsb;
>  	u64 factor = 1000000; // to improve precision of calculation
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: frequency");
> -	#endif
> +	dev_dbg(&spi->dev, "set: frequency");
>
>  	// calculat f step
>  	f_step = F_OSC * factor;
> @@ -250,16 +257,16 @@
>  	f_reg = frequency * factor;
>  	do_div(f_reg  , f_step);
>
> -	msb = (f_reg&0xff0000) >> 16;
> -	mid = (f_reg&0xff00)   >>  8;
> -	lsb = (f_reg&0xff);
> +	msb = (f_reg & 0xff0000) >> 16;
> +	mid = (f_reg & 0xff00)   >>  8;
> +	lsb = (f_reg & 0xff);
>
>  	// write to chip
> -	retval = WRITE_REG(REG_FRF_MSB, msb);
> +	retval = rf69_write_reg(spi, REG_FRF_MSB, msb);
>  	if (retval)  return retval;
> -	retval = WRITE_REG(REG_FRF_MID, mid);
> +	retval = rf69_write_reg(spi, REG_FRF_MID, mid);
>  	if (retval)  return retval;
> -	retval = WRITE_REG(REG_FRF_LSB, lsb);
> +	retval = rf69_write_reg(spi, REG_FRF_LSB, lsb);
>  	if (retval)  return retval;
>
>  	return 0;
> @@ -267,48 +274,41 @@
>
>  int rf69_set_amplifier_0(struct spi_device *spi, enum optionOnOff optionOnOff)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: amp #0");
> -	#endif
> +	dev_dbg(&spi->dev, "set: amp #0");
>
>  	switch(optionOnOff) {
> -	case optionOn:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) |  MASK_PALEVEL_PA0) );
> -	case optionOff:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_PA0) );
> +	case optionOn:	return setBit(spi, REG_PALEVEL, MASK_PALEVEL_PA0);
> +	case optionOff:	return rstBit(spi, REG_PALEVEL, MASK_PALEVEL_PA0);
>  	default:	INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_amplifier_1(struct spi_device *spi, enum optionOnOff optionOnOff)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: amp #1");
> -	#endif
> +	dev_dbg(&spi->dev, "set: amp #1");
>
>  	switch(optionOnOff) {
> -	case optionOn:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) |  MASK_PALEVEL_PA1) );
> -	case optionOff: return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_PA1) );
> +	case optionOn:	return setBit(spi, REG_PALEVEL, MASK_PALEVEL_PA1);
> +	case optionOff: return rstBit(spi, REG_PALEVEL, MASK_PALEVEL_PA1);
>  	default:	INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_amplifier_2(struct spi_device *spi, enum optionOnOff optionOnOff)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: amp #2");
> -	#endif
>
> +	dev_dbg(&spi->dev, "set: amp #2");
> +
>  	switch(optionOnOff) {
> -	case optionOn:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) |  MASK_PALEVEL_PA2) );
> -	case optionOff:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_PA2) );
> +	case optionOn:	return setBit(spi, REG_PALEVEL, MASK_PALEVEL_PA2);
> +	case optionOff:	return rstBit(spi, REG_PALEVEL, MASK_PALEVEL_PA2);
>  	default:	INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_output_power_level(struct spi_device *spi, u8 powerLevel)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: power level");
> -	#endif
> +	dev_dbg(&spi->dev, "set: power level");
>
>  	powerLevel +; // TODO Abh\E4ngigkeit von PA0,1,2 setting
>
> @@ -317,63 +317,57 @@
>  		INVALID_PARAM;
>
>  	// write value
> -	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_OUTPUT_POWER) | powerLevel);
> +	return rmw(spi, REG_PALEVEL, MASK_PALEVEL_OUTPUT_POWER, powerLevel);
>  }
>
>  int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp paRamp)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: pa ramp");
> -	#endif
> +	dev_dbg(&spi->dev, "set: pa ramp");
>
>  	switch(paRamp) {
> -	case ramp3400:	return WRITE_REG(REG_PARAMP, PARAMP_3400);
> -	case ramp2000:	return WRITE_REG(REG_PARAMP, PARAMP_2000);
> -	case ramp1000:	return WRITE_REG(REG_PARAMP, PARAMP_1000);
> -	case ramp500:	return WRITE_REG(REG_PARAMP, PARAMP_500);
> -	case ramp250:	return WRITE_REG(REG_PARAMP, PARAMP_250);
> -	case ramp125:	return WRITE_REG(REG_PARAMP, PARAMP_125);
> -	case ramp100:	return WRITE_REG(REG_PARAMP, PARAMP_100);
> -	case ramp62:	return WRITE_REG(REG_PARAMP, PARAMP_62);
> -	case ramp50:	return WRITE_REG(REG_PARAMP, PARAMP_50);
> -	case ramp40:	return WRITE_REG(REG_PARAMP, PARAMP_40);
> -	case ramp31:	return WRITE_REG(REG_PARAMP, PARAMP_31);
> -	case ramp25:	return WRITE_REG(REG_PARAMP, PARAMP_25);
> -	case ramp20:	return WRITE_REG(REG_PARAMP, PARAMP_20);
> -	case ramp15:	return WRITE_REG(REG_PARAMP, PARAMP_15);
> -	case ramp12:	return WRITE_REG(REG_PARAMP, PARAMP_12);
> -	case ramp10:	return WRITE_REG(REG_PARAMP, PARAMP_10);
> +	case ramp3400:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_3400);
> +	case ramp2000:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_2000);
> +	case ramp1000:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_1000);
> +	case ramp500:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_500);
> +	case ramp250:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_250);
> +	case ramp125:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_125);
> +	case ramp100:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_100);
> +	case ramp62:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_62);
> +	case ramp50:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_50);
> +	case ramp40:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_40);
> +	case ramp31:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_31);
> +	case ramp25:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_25);
> +	case ramp20:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_20);
> +	case ramp15:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_15);
> +	case ramp12:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_12);
> +	case ramp10:	return rf69_write_reg(spi, REG_PARAMP, PARAMP_10);
>  	default:	INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedance antennaImpedance)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: antenna impedance");
> -	#endif
> +	dev_dbg(&spi->dev, "set: antenna impedance");
>
>  	switch(antennaImpedance) {
> -	case fiftyOhm:	    return WRITE_REG(REG_LNA, (READ_REG(REG_LNA) & ~MASK_LNA_ZIN) );
> -	case twohundretOhm: return WRITE_REG(REG_LNA, (READ_REG(REG_LNA) |  MASK_LNA_ZIN) );
> +	case fiftyOhm:	    return rstBit(spi, REG_LNA, MASK_LNA_ZIN);
> +	case twohundretOhm: return setBit(spi, REG_LNA, MASK_LNA_ZIN);
>  	default:	    INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: lna gain");
> -	#endif
> +	dev_dbg(&spi->dev, "set: lna gain");
>
>  	switch(lnaGain) {
> -	case automatic:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_AUTO) );
> -	case max:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX) );
> -	case maxMinus6:  return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_6) );
> -	case maxMinus12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_12) );
> -	case maxMinus24: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_24) );
> -	case maxMinus36: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_36) );
> -	case maxMinus48: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_48) );
> +	case automatic:	 return rmw(spi, REG_LNA, MASK_LNA_GAIN, LNA_GAIN_AUTO);
> +	case max:	 return rmw(spi, REG_LNA, MASK_LNA_GAIN, LNA_GAIN_MAX);
> +	case maxMinus6:  return rmw(spi, REG_LNA, MASK_LNA_GAIN, LNA_GAIN_MAX_MINUS_6);
> +	case maxMinus12: return rmw(spi, REG_LNA, MASK_LNA_GAIN, LNA_GAIN_MAX_MINUS_12);
> +	case maxMinus24: return rmw(spi, REG_LNA, MASK_LNA_GAIN, LNA_GAIN_MAX_MINUS_24);
> +	case maxMinus36: return rmw(spi, REG_LNA, MASK_LNA_GAIN, LNA_GAIN_MAX_MINUS_36);
> +	case maxMinus48: return rmw(spi, REG_LNA, MASK_LNA_GAIN, LNA_GAIN_MAX_MINUS_48);
>  	default:	 INVALID_PARAM;
>  	}
>  }
> @@ -382,11 +376,9 @@
>  {
>  	u8 currentValue;
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "get: lna gain");
> -	#endif
> +	dev_dbg(&spi->dev, "get: lna gain");
>
> -	currentValue = READ_REG(REG_LNA);
> +	currentValue = rf69_read_reg(spi, REG_LNA);
>
>  	switch (currentValue & MASK_LNA_GAIN)
>  	{
> @@ -404,32 +396,28 @@
>  static int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi ,u8 reg, enum dccPercent dccPercent)
>  {
>  	switch (dccPercent) {
> -	case dcc16Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_16_PERCENT) );
> -	case dcc8Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_8_PERCENT) );
> -	case dcc4Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_4_PERCENT) );
> -	case dcc2Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_2_PERCENT) );
> -	case dcc1Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_1_PERCENT) );
> -	case dcc0_5Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_0_5_PERCENT) );
> -	case dcc0_25Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_0_25_PERCENT) );
> -	case dcc0_125Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_0_125_PERCENT) );
> +	case dcc16Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_16_PERCENT);
> +	case dcc8Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_8_PERCENT);
> +	case dcc4Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_4_PERCENT);
> +	case dcc2Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_2_PERCENT);
> +	case dcc1Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_1_PERCENT);
> +	case dcc0_5Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_0_5_PERCENT);
> +	case dcc0_25Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_0_25_PERCENT);
> +	case dcc0_125Percent:	return rmw(spi, reg, MASK_BW_DCC_FREQ, BW_DCC_0_125_PERCENT);
>  	default:		INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent dccPercent)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: cut off freq");
> -	#endif
> +	dev_dbg(&spi->dev, "set: cut off freq");
>
>  	return rf69_set_dc_cut_off_frequency_intern(spi, REG_RXBW, dccPercent);
>  }
>
>  int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPercent dccPercent)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: cut off freq during afc");
> -	#endif
> +	dev_dbg(&spi->dev, "set: cut off freq during afc");
>
>  	return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);
>  }
> @@ -442,10 +430,10 @@
>  	if (exponent > 7)   INVALID_PARAM;
>  	if ( (mantisse!=mantisse16) &&
>  	     (mantisse!=mantisse20) &&
> -             (mantisse!=mantisse24) ) INVALID_PARAM;
> +	     (mantisse!=mantisse24) ) INVALID_PARAM;
>
>  	// read old value
> -	newValue = READ_REG(reg);
> +	newValue = rf69_read_reg(spi, reg);
>
>  	// "delete" mantisse and exponent = just keep the DCC setting
>  	newValue = newValue & MASK_BW_DCC_FREQ;
> @@ -461,76 +449,66 @@
>  	newValue = newValue | exponent;
>
>  	// write back
> -	return WRITE_REG(reg, newValue);
> +	return rf69_write_reg(spi, reg, newValue);
>  }
>
>  int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8 exponent)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: band width");
> -	#endif
> +	dev_dbg(&spi->dev, "set: band width");
>
>  	return rf69_set_bandwidth_intern(spi, REG_RXBW, mantisse, exponent);
>  }
>
>  int rf69_set_bandwidth_during_afc(struct spi_device *spi, enum mantisse mantisse, u8 exponent)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: band width during afc");
> -	#endif
> +	dev_dbg(&spi->dev, "set: band width during afc");
>
>  	return rf69_set_bandwidth_intern(spi, REG_AFCBW, mantisse, exponent);
>  }
>
>  int rf69_set_ook_threshold_type(struct spi_device *spi, enum thresholdType thresholdType)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: threshold type");
> -	#endif
> +	dev_dbg(&spi->dev, "set: threshold type");
>
>  	switch (thresholdType)
>  	{
> -	case fixed:	return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_FIXED) );
> -	case peak:	return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_PEAK) );
> -	case average:	return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_AVERAGE) );
> +	case fixed:	return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESTYPE, OOKPEAK_THRESHTYPE_FIXED);
> +	case peak:	return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESTYPE, OOKPEAK_THRESHTYPE_PEAK);
> +	case average:	return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESTYPE, OOKPEAK_THRESHTYPE_AVERAGE);
>  	default:	INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_ook_threshold_step(struct spi_device *spi, enum thresholdStep thresholdStep)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: threshold step");
> -	#endif
> +	dev_dbg(&spi->dev, "set: threshold step");
>
>  	switch (thresholdStep) {
> -	case step_0_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_0_5_DB) );
> -	case step_1_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_0_DB) );
> -	case step_1_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_5_DB) );
> -	case step_2_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_2_0_DB) );
> -	case step_3_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_3_0_DB) );
> -	case step_4_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_4_0_DB) );
> -	case step_5_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_5_0_DB) );
> -	case step_6_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_6_0_DB) );
> +	case step_0_5db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_0_5_DB);
> +	case step_1_0db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_1_0_DB);
> +	case step_1_5db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_1_5_DB);
> +	case step_2_0db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_2_0_DB);
> +	case step_3_0db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_3_0_DB);
> +	case step_4_0db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_4_0_DB);
> +	case step_5_0db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_5_0_DB);
> +	case step_6_0db: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESSTEP, OOKPEAK_THRESHSTEP_6_0_DB);
>  	default:	 INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_ook_threshold_dec(struct spi_device *spi, enum thresholdDecrement thresholdDecrement)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: threshold decrement");
> -	#endif
> +	dev_dbg(&spi->dev, "set: threshold decrement");
>
>  	switch (thresholdDecrement) {
> -	case dec_every8th: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_8TH) );
> -	case dec_every4th: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_4TH) );
> -	case dec_every2nd: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_2ND) );
> -	case dec_once:	   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_ONCE) );
> -	case dec_twice:	   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_TWICE) );
> -	case dec_4times:   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_4_TIMES) );
> -	case dec_8times:   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_8_TIMES) );
> -	case dec_16times:  return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_16_TIMES) );
> +	case dec_every8th: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_EVERY_8TH);
> +	case dec_every4th: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_EVERY_4TH);
> +	case dec_every2nd: return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_EVERY_2ND);
> +	case dec_once:	   return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_ONCE);
> +	case dec_twice:	   return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_TWICE);
> +	case dec_4times:   return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_4_TIMES);
> +	case dec_8times:   return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_8_TIMES);
> +	case dec_16times:  return rmw(spi, REG_OOKPEAK, MASK_OOKPEAK_THRESDEC, OOKPEAK_THRESHDEC_16_TIMES);
>  	default:	   INVALID_PARAM;
>  	}
>  }
> @@ -542,9 +520,7 @@
>  	u8 regaddr;
>  	u8 regValue;
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: DIO mapping");
> -	#endif
> +	dev_dbg(&spi->dev, "set: DIO mapping");
>
>  	// check DIO number
>  	if (DIONumber > 5) INVALID_PARAM;
> @@ -559,88 +535,78 @@
>  	}
>
>  	// read reg
> -	regValue=READ_REG(regaddr);
> +	regValue=rf69_read_reg(spi, regaddr);
>  	// delete old value
>  	regValue = regValue & ~mask;
>  	// add new value
>  	regValue = regValue | value << shift;
>  	// write back
> -	return WRITE_REG(regaddr,regValue);
> +	return rf69_write_reg(spi, regaddr,regValue);
>  }
>
>  bool rf69_get_flag(struct spi_device *spi, enum flag flag)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "get: flag");
> -	#endif
> +	dev_dbg(&spi->dev, "get: flag");
>
>  	switch(flag) {
> -	case modeSwitchCompleted:     return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_MODE_READY);
> -	case readyToReceive:	      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_RX_READY);
> -	case readyToSend:	      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_TX_READY);
> -	case pllLocked:		      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_PLL_LOCK);
> -	case rssiExceededThreshold:   return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_RSSI);
> -	case timeout:		      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_TIMEOUT);
> -	case automode:		      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_AUTOMODE);
> -	case syncAddressMatch:	      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
> -	case fifoFull:		      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_FULL);
> -/*	case fifoNotEmpty:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_NOT_EMPTY); */
> -	case fifoEmpty:		      return !(READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_NOT_EMPTY);
> -	case fifoLevelBelowThreshold: return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_LEVEL);
> -	case fifoOverrun:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_OVERRUN);
> -	case packetSent:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_PACKET_SENT);
> -	case payloadReady:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_PAYLOAD_READY);
> -	case crcOk:		      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_CRC_OK);
> -	case batteryLow:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_LOW_BAT);
> +	case modeSwitchCompleted:     return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_MODE_READY);
> +	case readyToReceive:	      return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_RX_READY);
> +	case readyToSend:	      return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_TX_READY);
> +	case pllLocked:		      return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_PLL_LOCK);
> +	case rssiExceededThreshold:   return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_RSSI);
> +	case timeout:		      return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_TIMEOUT);
> +	case automode:		      return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_AUTOMODE);
> +	case syncAddressMatch:	      return (rf69_read_reg(spi, REG_IRQFLAGS1) & MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
> +	case fifoFull:		      return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_FULL);
> +/*	case fifoNotEmpty:	      return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_NOT_EMPTY); */
> +	case fifoEmpty:		      return !(rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_NOT_EMPTY);
> +	case fifoLevelBelowThreshold: return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_LEVEL);
> +	case fifoOverrun:	      return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_OVERRUN);
> +	case packetSent:	      return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_PACKET_SENT);
> +	case payloadReady:	      return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_PAYLOAD_READY);
> +	case crcOk:		      return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_CRC_OK);
> +	case batteryLow:	      return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_LOW_BAT);
>  	default:		      return false;
>  	}
>  }
>
>  int rf69_reset_flag(struct spi_device *spi, enum flag flag)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "reset: flag");
> -	#endif
> +	dev_dbg(&spi->dev, "reset: flag");
>
>  	switch(flag) {
> -	case rssiExceededThreshold: return WRITE_REG(REG_IRQFLAGS1, MASK_IRQFLAGS1_RSSI);
> -	case syncAddressMatch:	    return WRITE_REG(REG_IRQFLAGS1, MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
> -	case fifoOverrun:	    return WRITE_REG(REG_IRQFLAGS2, MASK_IRQFLAGS2_FIFO_OVERRUN);
> +	case rssiExceededThreshold: return rf69_write_reg(spi, REG_IRQFLAGS1, MASK_IRQFLAGS1_RSSI);
> +	case syncAddressMatch:	    return rf69_write_reg(spi, REG_IRQFLAGS1, MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
> +	case fifoOverrun:	    return rf69_write_reg(spi, REG_IRQFLAGS2, MASK_IRQFLAGS2_FIFO_OVERRUN);
>  	default:		    INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_rssi_threshold(struct spi_device *spi, u8 threshold)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: rssi threshold");
> -	#endif
> +	dev_dbg(&spi->dev, "set: rssi threshold");
>
>  	/* no value check needed - u8 exactly matches register size */
>
> -	return WRITE_REG(REG_RSSITHRESH, threshold);
> +	return rf69_write_reg(spi, REG_RSSITHRESH, threshold);
>  }
>
>  int rf69_set_rx_start_timeout(struct spi_device *spi, u8 timeout)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: start timeout");
> -	#endif
> +	dev_dbg(&spi->dev, "set: start timeout");
>
>  	/* no value check needed - u8 exactly matches register size */
>
> -	return WRITE_REG(REG_RXTIMEOUT1, timeout);
> +	return rf69_write_reg(spi, REG_RXTIMEOUT1, timeout);
>  }
>
>  int rf69_set_rssi_timeout(struct spi_device *spi, u8 timeout)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: rssi timeout");
> -	#endif
> +	dev_dbg(&spi->dev, "set: rssi timeout");
>
>  	/* no value check needed - u8 exactly matches register size */
>
> -	return WRITE_REG(REG_RXTIMEOUT2, timeout);
> +	return rf69_write_reg(spi, REG_RXTIMEOUT2, timeout);
>  }
>
>  int rf69_set_preamble_length(struct spi_device *spi, u16 preambleLength)
> @@ -648,9 +614,7 @@
>  	int retval;
>  	u8 msb, lsb;
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: preample length");
> -	#endif
> +	dev_dbg(&spi->dev, "set: preample length");
>
>  	/* no value check needed - u16 exactly matches register size */
>
> @@ -659,172 +623,146 @@
>  	lsb = (preambleLength&0xff);
>
>  	/* transmit to chip */
> -	retval = WRITE_REG(REG_PREAMBLE_MSB, msb);
> +	retval = rf69_write_reg(spi, REG_PREAMBLE_MSB, msb);
>  	if (retval) return retval;
> -	retval = WRITE_REG(REG_PREAMBLE_LSB, lsb);
> +	retval = rf69_write_reg(spi, REG_PREAMBLE_LSB, lsb);
>
>  	return retval;
>  }
>
>  int rf69_set_sync_enable(struct spi_device *spi, enum optionOnOff optionOnOff)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: sync enable");
> -	#endif
> +	dev_dbg(&spi->dev, "set: sync enable");
>
>  	switch(optionOnOff) {
> -	case optionOn:	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) |  MASK_SYNC_CONFIG_SYNC_ON) );
> -	case optionOff:	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_SYNC_ON) );
> +	case optionOn:	return setBit(spi, REG_SYNC_CONFIG, MASK_SYNC_CONFIG_SYNC_ON);
> +	case optionOff:	return rstBit(spi, REG_SYNC_CONFIG, MASK_SYNC_CONFIG_SYNC_ON);
>  	default:	INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_fifo_fill_condition(struct spi_device *spi, enum fifoFillCondition fifoFillCondition)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: fifo fill condition");
> -	#endif
> +	dev_dbg(&spi->dev, "set: fifo fill condition");
>
>  	switch(fifoFillCondition) {
> -	case always:		 return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) |  MASK_SYNC_CONFIG_FIFO_FILL_CONDITION) );
> -	case afterSyncInterrupt: return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_FIFO_FILL_CONDITION) );
> +	case always:		 return setBit(spi, REG_SYNC_CONFIG, MASK_SYNC_CONFIG_FIFO_FILL_CONDITION);
> +	case afterSyncInterrupt: return rstBit(spi, REG_SYNC_CONFIG, MASK_SYNC_CONFIG_FIFO_FILL_CONDITION);
>  	default:		 INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_sync_size(struct spi_device *spi, u8 syncSize)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: sync size");
> -	#endif
> +	dev_dbg(&spi->dev, "set: sync size");
>
>  	// check input value
>  	if (syncSize > 0x07)
>  		INVALID_PARAM;
>
>  	// write value
> -	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_SYNC_SIZE) | (syncSize << 3) );
> +	return rmw(spi, REG_SYNC_CONFIG, MASK_SYNC_CONFIG_SYNC_SIZE, (syncSize << 3));
>  }
>
>  int rf69_set_sync_tolerance(struct spi_device *spi, u8 syncTolerance)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: sync tolerance");
> -	#endif
> +	dev_dbg(&spi->dev, "set: sync tolerance");
>
>  	// check input value
>  	if (syncTolerance > 0x07)
>  		INVALID_PARAM;
>
>  	// write value
> -	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_SYNC_SIZE) | syncTolerance);
> +	return rmw(spi, REG_SYNC_CONFIG, MASK_SYNC_CONFIG_SYNC_SIZE, syncTolerance);
>  }
>
>  int rf69_set_sync_values(struct spi_device *spi, u8 syncValues[8])
>  {
>  	int retval = 0;
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: sync values");
> -	#endif
> +	dev_dbg(&spi->dev, "set: sync values");
>
> -	retval += WRITE_REG(REG_SYNCVALUE1, syncValues[0]);
> -	retval += WRITE_REG(REG_SYNCVALUE2, syncValues[1]);
> -	retval += WRITE_REG(REG_SYNCVALUE3, syncValues[2]);
> -	retval += WRITE_REG(REG_SYNCVALUE4, syncValues[3]);
> -	retval += WRITE_REG(REG_SYNCVALUE5, syncValues[4]);
> -	retval += WRITE_REG(REG_SYNCVALUE6, syncValues[5]);
> -	retval += WRITE_REG(REG_SYNCVALUE7, syncValues[6]);
> -	retval += WRITE_REG(REG_SYNCVALUE8, syncValues[7]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE1, syncValues[0]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE2, syncValues[1]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE3, syncValues[2]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE4, syncValues[3]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE5, syncValues[4]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE6, syncValues[5]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE7, syncValues[6]);
> +	retval += rf69_write_reg(spi, REG_SYNCVALUE8, syncValues[7]);
>
>  	return retval;
>  }
>
>  int rf69_set_packet_format(struct spi_device * spi, enum packetFormat packetFormat)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: packet format");
> -	#endif
> +	dev_dbg(&spi->dev, "set: packet format");
>
>  	switch(packetFormat) {
> -	case packetLengthVar: return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) |  MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE) );
> -	case packetLengthFix: return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE) );
> +	case packetLengthVar: return setBit(spi, REG_PACKETCONFIG1, MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE);
> +	case packetLengthFix: return rstBit(spi, REG_PACKETCONFIG1, MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE);
>  	default:	      INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_crc_enable(struct spi_device *spi, enum optionOnOff optionOnOff)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: crc enable");
> -	#endif
> +	dev_dbg(&spi->dev, "set: crc enable");
>
>  	switch(optionOnOff) {
> -	case optionOn:	return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) |  MASK_PACKETCONFIG1_CRC_ON) );
> -	case optionOff:	return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_CRC_ON) );
> +	case optionOn:	return setBit(spi, REG_PACKETCONFIG1, MASK_PACKETCONFIG1_CRC_ON);
> +	case optionOff:	return rstBit(spi, REG_PACKETCONFIG1, MASK_PACKETCONFIG1_CRC_ON);
>  	default:	INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_adressFiltering(struct spi_device *spi, enum addressFiltering addressFiltering)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: address filtering");
> -	#endif
> +	dev_dbg(&spi->dev, "set: address filtering");
>
>  	switch (addressFiltering) {
> -	case filteringOff:	     return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSFILTERING_OFF) );
> -	case nodeAddress:	     return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSFILTERING_NODE) );
> -	case nodeOrBroadcastAddress: return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSFILTERING_NODEBROADCAST) );
> +	case filteringOff:	     return rmw(spi, REG_PACKETCONFIG1, MASK_PACKETCONFIG1_ADDRESSFILTERING, PACKETCONFIG1_ADDRESSFILTERING_OFF);
> +	case nodeAddress:	     return rmw(spi, REG_PACKETCONFIG1, MASK_PACKETCONFIG1_ADDRESSFILTERING, PACKETCONFIG1_ADDRESSFILTERING_NODE);
> +	case nodeOrBroadcastAddress: return rmw(spi, REG_PACKETCONFIG1, MASK_PACKETCONFIG1_ADDRESSFILTERING, PACKETCONFIG1_ADDRESSFILTERING_NODEBROADCAST);
>  	default:		     INVALID_PARAM;
>  	}
>  }
>
>  int rf69_set_payload_length(struct spi_device *spi, u8 payloadLength)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: payload length");
> -	#endif
> +	dev_dbg(&spi->dev, "set: payload length");
>
> -	return WRITE_REG(REG_PAYLOAD_LENGTH, payloadLength);
> +	return rf69_write_reg(spi, REG_PAYLOAD_LENGTH, payloadLength);
>  }
>
>  u8  rf69_get_payload_length(struct spi_device *spi)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "get: payload length");
> -	#endif
> +	dev_dbg(&spi->dev, "get: payload length");
>
> -	return (u8) READ_REG(REG_PAYLOAD_LENGTH);
> +	return (u8) rf69_read_reg(spi, REG_PAYLOAD_LENGTH);
>  }
>
>  int rf69_set_node_address(struct spi_device *spi, u8 nodeAddress)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: node address");
> -	#endif
> +	dev_dbg(&spi->dev, "set: node address");
>
> -	return WRITE_REG(REG_NODEADRS, nodeAddress);
> +	return rf69_write_reg(spi, REG_NODEADRS, nodeAddress);
>  }
>
>  int rf69_set_broadcast_address(struct spi_device *spi, u8 broadcastAddress)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: broadcast address");
> -	#endif
> +	dev_dbg(&spi->dev, "set: broadcast address");
>
> -	return WRITE_REG(REG_BROADCASTADRS, broadcastAddress);
> +	return rf69_write_reg(spi, REG_BROADCASTADRS, broadcastAddress);
>  }
>
>  int rf69_set_tx_start_condition(struct spi_device *spi, enum txStartCondition txStartCondition)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: start condition");
> -	#endif
> +	dev_dbg(&spi->dev, "set: start condition");
>
>  	switch(txStartCondition) {
> -	case fifoLevel:	   return WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) & ~MASK_FIFO_THRESH_TXSTART) );
> -	case fifoNotEmpty: return WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) |  MASK_FIFO_THRESH_TXSTART) );
> +	case fifoLevel:	   return rstBit(spi, REG_FIFO_THRESH, MASK_FIFO_THRESH_TXSTART);
> +	case fifoNotEmpty: return setBit(spi, REG_FIFO_THRESH, MASK_FIFO_THRESH_TXSTART);
>  	default:	   INVALID_PARAM;
>  	}
>  }
> @@ -833,33 +771,30 @@
>  {
>  	int retval;
>
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: fifo threshold");
> -	#endif
> +	dev_dbg(&spi->dev, "set: fifo threshold");
>
> -	// check input value
> +	/* check input value */
>  	if (threshold & 0x80)
>  		INVALID_PARAM;
>
> -	// write value
> -	retval = WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) & ~MASK_FIFO_THRESH_VALUE) | threshold);
> +	/* write value */
> +	retval = rmw(spi, REG_FIFO_THRESH, MASK_FIFO_THRESH_VALUE, threshold);
>  	if (retval)
>  		return retval;
>
> -	// access the fifo to activate new threshold
> -	return rf69_read_fifo (spi, (u8*) &retval, 1); // retval used as buffer
> +	/* access the fifo to activate new threshold
> +	 * retval (mis)used as buffer here*/
> +	return rf69_read_fifo (spi, (u8*) &retval, 1);
>  }
>
>  int rf69_set_dagc(struct spi_device *spi, enum dagc dagc)
>  {
> -	#ifdef DEBUG
> -		dev_dbg(&spi->dev, "set: dagc");
> -	#endif
> +	dev_dbg(&spi->dev, "set: dagc");
>
>  	switch(dagc) {
> -	case normalMode:		 return WRITE_REG(REG_TESTDAGC, DAGC_NORMAL);
> -	case improve:			 return WRITE_REG(REG_TESTDAGC, DAGC_IMPROVED_LOWBETA0);
> -	case improve4LowModulationIndex: return WRITE_REG(REG_TESTDAGC, DAGC_IMPROVED_LOWBETA1);
> +	case normalMode:		 return rf69_write_reg(spi, REG_TESTDAGC, DAGC_NORMAL);
> +	case improve:			 return rf69_write_reg(spi, REG_TESTDAGC, DAGC_IMPROVED_LOWBETA0);
> +	case improve4LowModulationIndex: return rf69_write_reg(spi, REG_TESTDAGC, DAGC_IMPROVED_LOWBETA1);
>  	default:			 INVALID_PARAM;
>  	}
>  }
> @@ -871,15 +806,14 @@
>  	#ifdef DEBUG_FIFO_ACCESS
>  		int i;
>  	#endif
> +
>  	struct spi_transfer transfer;
>  	u8 local_buffer[FIFO_SIZE + 1];
>  	int retval;
>
>  	if (size > FIFO_SIZE)
>  	{
> -		#ifdef DEBUG
> -			dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then internal buffer \n");
> -		#endif
> +		dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then internal buffer \n");
>  		return -EMSGSIZE;
>  	}
>
> @@ -912,9 +846,7 @@
>
>  	if (size > FIFO_SIZE)
>  	{
> -		#ifdef DEBUG
> -			dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then internal buffer \n");
> -		#endif
> +		dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then internal buffer \n");
>  		return -EMSGSIZE;
>  	}
>
>
>
>

