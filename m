From: "Cai, Cliff" <Cliff.Cai@analog.com>
Date: Mon, 15 Nov 2010 01:20:17 +0000
Subject: RE: [patch] Staging: iio/dds: double locking bugs
Message-Id: <DB904C5425BA6F4E8424B3B51A1414D1659B326F37@NWD2CMBX1.ad.analog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101113090532.GN3533@bicker>
In-Reply-To: <20101113090532.GN3533@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



>-----Original Message-----
>From: Hennerich, Michael
>Sent: Monday, November 15, 2010 4:46 AM
>To: Dan Carpenter; Greg Kroah-Hartman
>Cc: Mike Frysinger; Jonathan Cameron; Cai, Cliff;
>devel@driverdev.osuosl.org; kernel-janitors@vger.kernel.org
>Subject: RE: [patch] Staging: iio/dds: double locking bugs
>
>Dan Carpenter wrote on 2010-11-13:
>> This is a static checker patch and I don't have this hardware.
>>
>> This code is unusual because while I've often seen a double
>lock, this
>> is the first time I've seen code that takes a lock 11 times in a row.
>> I feel like I must have missed something.  But I've looked very
>> carefully I don't see any way the original code is correct.  Does
>> spi_sync() somehow release the lock in a way that I can't see?  Even
>> if it does, the locking would still be wrong.
>
>This is simply bad code, and likely committed untested.
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
>Acked-by: Michael Hennerich <michael.hennerich@analog.com>

Thanks

Acked-by: Cliff Cai <cliff.cai@analog.com>

Cliff




>> This should be easy to test for someone with the hardware.
>The ad9910
>> driver should lock up on init.
>>
>> diff --git a/drivers/staging/iio/dds/ad9951.c
>> b/drivers/staging/iio/dds/ad9951.c index bc3beff..57eddf6 100644 ---
>> a/drivers/staging/iio/dds/ad9951.c +++
>> b/drivers/staging/iio/dds/ad9951.c @@ -79,7 +79,6 @@ static ssize_t
>> ad9951_set_parameter(struct device *dev,
>>
>>      xfer.len = 2;
>>      xfer.tx_buf = &config->arr[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -89,7 +88,6 @@ static ssize_t ad9951_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->ftw0[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -99,7 +97,6 @@ static ssize_t ad9951_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 3;
>>      xfer.tx_buf = &config->ftw1[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg); @@ -143,8
>>  +140,6 @@ static void ad9951_init(struct ad9951_state *st)  cfr[2] >>  HSPD_SYNC;  cfr[3] = 0;
>> -    mutex_lock(&st->lock);
>> -
>>      xfer.len = 4;
>>      xfer.tx_buf = &cfr;
>> diff --git a/drivers/staging/iio/dds/ad9910.c
>> b/drivers/staging/iio/dds/ad9910.c index c59b4079..e8fb75c
>100644 ---
>> a/drivers/staging/iio/dds/ad9910.c +++
>> b/drivers/staging/iio/dds/ad9910.c @@ -138,7 +138,6 @@
>static ssize_t
>> ad9910_set_parameter(struct device *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->ioupd[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -148,7 +147,6 @@ static ssize_t
>ad9910_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->ftw[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -158,7 +156,6 @@ static ssize_t
>ad9910_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 3;
>>      xfer.tx_buf = &config->pow[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -168,7 +165,6 @@ static ssize_t
>ad9910_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->asf[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -178,7 +174,6 @@ static ssize_t
>ad9910_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->multc[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -188,7 +183,6 @@ static ssize_t
>ad9910_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 9;
>>      xfer.tx_buf = &config->dig_rampl[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -198,7 +192,6 @@ static ssize_t
>ad9910_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 9;
>>      xfer.tx_buf = &config->dig_ramps[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -208,7 +201,6 @@ static ssize_t
>ad9910_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->dig_rampr[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -218,25 +210,24 @@ static ssize_t ad9910_set_parameter(struct
>> device *dev,
>>
>>      xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep0[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg);     ret >>  spi_sync(st->sdev, &msg);   if (ret)                goto
>error_ret; +   xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep1[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg);     ret >>  spi_sync(st->sdev, &msg);   if (ret)                goto
>error_ret; +   xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep2[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -245,43 +236,42 @@ static ssize_t ad9910_set_parameter(struct
>> device *dev,
>>              goto error_ret;
>>      xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep3[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg);     ret >>  spi_sync(st->sdev, &msg);   if (ret)                goto
>error_ret; +   xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep4[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg);     ret >>  spi_sync(st->sdev, &msg);   if (ret)                goto
>error_ret; +   xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep5[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg);     ret >>  spi_sync(st->sdev, &msg);   if (ret)                goto
>error_ret; +   xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep6[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg);     ret >>  spi_sync(st->sdev, &msg);   if (ret)                goto
>error_ret; +   xfer.len = 9;
>>      xfer.tx_buf = &config->sin_tonep7[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg); @@ -326,8
>>  +316,6 @@ static void ad9910_init(struct ad9910_state *st)  cfr[3] >>  TX_ENA | PDCLK_INV | PDCLK_ENB;     cfr[4] = PARA_ENA;
>> -    mutex_lock(&st->lock);
>> -
>>      xfer.len = 5;
>>      xfer.tx_buf = &cfr;
>> @@ -343,8 +331,6 @@ static void ad9910_init(struct ad9910_state *st)
>>      cfr[3] = REFCLK_RST | REFCLK_BYP;
>>      cfr[4] = 0;
>> -    mutex_lock(&st->lock);
>> -
>>      xfer.len = 5;
>>      xfer.tx_buf = &cfr;
>> diff --git a/drivers/staging/iio/dds/ad9852.c
>> b/drivers/staging/iio/dds/ad9852.c index 0a41d25..594fb6a 100644 ---
>> a/drivers/staging/iio/dds/ad9852.c +++
>> b/drivers/staging/iio/dds/ad9852.c @@ -86,7 +86,6 @@ static ssize_t
>> ad9852_set_parameter(struct device *dev,
>>
>>      xfer.len = 3;
>>      xfer.tx_buf = &config->phajst1[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -96,7 +95,6 @@ static ssize_t ad9852_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 6;
>>      xfer.tx_buf = &config->fretun1[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -106,7 +104,6 @@ static ssize_t
>ad9852_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 6;
>>      xfer.tx_buf = &config->fretun2[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -116,7 +113,6 @@ static ssize_t
>ad9852_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 6;
>>      xfer.tx_buf = &config->dltafre[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -126,7 +122,6 @@ static ssize_t
>ad9852_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->updtclk[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -136,7 +131,6 @@ static ssize_t
>ad9852_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 4;
>>      xfer.tx_buf = &config->ramprat[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -146,7 +140,6 @@ static ssize_t
>ad9852_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 5;
>>      xfer.tx_buf = &config->control[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -156,7 +149,6 @@ static ssize_t
>ad9852_set_parameter(struct device
>> *dev,
>>
>>      xfer.len = 3;
>>      xfer.tx_buf = &config->outpskm[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> @@ -166,16 +158,15 @@ static ssize_t ad9852_set_parameter(struct
>> device *dev,
>>
>>      xfer.len = 2;
>>      xfer.tx_buf = &config->outpskr[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>spi_message_add_tail(&xfer, &msg);     ret >>  spi_sync(st->sdev, &msg);   if (ret)                goto
>error_ret; +   xfer.len = 3;
>>      xfer.tx_buf = &config->daccntl[0];
>> -    mutex_lock(&st->lock);
>>
>>      spi_message_init(&msg);
>>      spi_message_add_tail(&xfer, &msg);
>> diff --git a/drivers/staging/iio/dds/ad9832.c
>> b/drivers/staging/iio/dds/ad9832.c index a4bb048..e911893 100644 ---
>> a/drivers/staging/iio/dds/ad9832.c +++
>> b/drivers/staging/iio/dds/ad9832.c @@ -166,8 +166,6 @@ static void
>> ad9832_init(struct ad9832_state *st)
>>
>>      config = 0x3 << 14;
>> -    mutex_lock(&st->lock);
>> -
>>      xfer.len = 2;
>>      xfer.tx_buf = &config;
>
>Greetings,
>Michael
>
>--
>Analog Devices GmbH      Wilhelm-Wagenfeld-Str. 6      80807 Muenchen
>Sitz der Gesellschaft Muenchen, Registergericht Muenchen HRB
>4036 Geschaeftsfuehrer Thomas Wessel, William A. Martin, Margaret Seif
>
>
