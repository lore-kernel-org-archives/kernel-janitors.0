From: Joe Perches <joe@perches.com>
Date: Fri, 24 Jan 2020 20:22:52 +0000
Subject: Re: [PATCH] iio: ad5755: fix spelling mistake "to" -> "too"
Message-Id: <315149bed8f3442fabcb36ec9d8c8caffe8e11eb.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200122235839.2830850-1-colin.king@canonical.com>
         <c32a44272aa593c3d0cda71a50b08f33338a2dc0.camel@analog.com>
         <69bbc2af79d9463681b54d0aa240f89b@AcuMS.aculab.com>
In-Reply-To: <69bbc2af79d9463681b54d0aa240f89b@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>, "'Ardelean, Alexandru'" <alexandru.Ardelean@analog.com>, "zzzzPopa, zzzzStefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "jic23@kernel.org" <jic23@kernel.org>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, 2020-01-23 at 14:55 +0000, David Laight wrote:
> From Ardelean, Alexandru
> > Sent: 23 January 2020 07:03
> > 
> > On Wed, 2020-01-22 at 23:58 +0000, Colin King wrote:
> > > [External]
> > > 
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > There is a spelling mistake in a dev_err message. Fix it.
> > > 
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/iio/dac/ad5755.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
> > > index b9175fb4c8ab..dad0b26228a2 100644
> > > --- a/drivers/iio/dac/ad5755.c
> > > +++ b/drivers/iio/dac/ad5755.c
> > > @@ -655,7 +655,7 @@ static struct ad5755_platform_data *ad5755_parse_dt(struct
> > > device *dev)
> > >  	for_each_child_of_node(np, pp) {
> > >  		if (devnr >= AD5755_NUM_CHANNELS) {
> > >  			dev_err(dev,
> > > -				"There is to many channels defined in DT\n");
> > > +				"There is too many channels defined in DT\n");
> > 
> > If going for the spelling stuff, maybe also change "is" to "are":
> > 'There are too many channels defined in DT\n'
> 
> Probably better still: "The DT defines too many channels\n"

bikeshedding:

How about fixing:

o missing newlines
o odd indentation
o unnecessary braces
o message grammar

at the same time?
---
 drivers/iio/dac/ad5755.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
index b9175f..f6e4cf92 100644
--- a/drivers/iio/dac/ad5755.c
+++ b/drivers/iio/dac/ad5755.c
@@ -631,10 +631,9 @@ static struct ad5755_platform_data *ad5755_parse_dt(struct device *dev)
 			}
 		}
 
-		if (i = ARRAY_SIZE(ad5755_dcdc_freq_table)) {
+		if (i = ARRAY_SIZE(ad5755_dcdc_freq_table))
 			dev_err(dev,
-				"adi,dc-dc-freq out of range selecting 410kHz");
-		}
+				"adi,dc-dc-freq out of range selecting 410kHz\n");
 	}
 
 	pdata->dc_dc_maxv = AD5755_DC_DC_MAXV_23V;
@@ -645,17 +644,15 @@ static struct ad5755_platform_data *ad5755_parse_dt(struct device *dev)
 				break;
 			}
 		}
-		if (i = ARRAY_SIZE(ad5755_dcdc_maxv_table)) {
-				dev_err(dev,
-					"adi,dc-dc-maxv out of range selecting 23V");
-		}
+		if (i = ARRAY_SIZE(ad5755_dcdc_maxv_table))
+			dev_err(dev,
+				"adi,dc-dc-maxv out of range selecting 23V\n");
 	}
 
 	devnr = 0;
 	for_each_child_of_node(np, pp) {
 		if (devnr >= AD5755_NUM_CHANNELS) {
-			dev_err(dev,
-				"There is to many channels defined in DT\n");
+			dev_err(dev, "Too many channels defined in DT\n");
 			goto error_out;
 		}
 
@@ -681,11 +678,10 @@ static struct ad5755_platform_data *ad5755_parse_dt(struct device *dev)
 					break;
 				}
 			}
-			if (i = ARRAY_SIZE(ad5755_slew_rate_table)) {
+			if (i = ARRAY_SIZE(ad5755_slew_rate_table))
 				dev_err(dev,
-					"channel %d slew rate out of range selecting 64kHz",
+					"channel %d slew rate out of range selecting 64kHz\n",
 					devnr);
-			}
 
 			pdata->dac[devnr].slew.step_size = AD5755_SLEW_STEP_SIZE_1;
 			for (i = 0; i < ARRAY_SIZE(ad5755_slew_step_table); i++) {
@@ -695,11 +691,10 @@ static struct ad5755_platform_data *ad5755_parse_dt(struct device *dev)
 					break;
 				}
 			}
-			if (i = ARRAY_SIZE(ad5755_slew_step_table)) {
+			if (i = ARRAY_SIZE(ad5755_slew_step_table))
 				dev_err(dev,
-					"channel %d slew step size out of range selecting 1 LSB",
+					"channel %d slew step size out of range selecting 1 LSB\n",
 					devnr);
-			}
 		} else {
 			pdata->dac[devnr].slew.enable = false;
 			pdata->dac[devnr].slew.rate = AD5755_SLEW_RATE_64k;
