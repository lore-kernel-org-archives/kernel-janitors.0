From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Date: Wed, 02 Aug 2017 12:07:37 +0000
Subject: Re: [PATCH] staging: pi433: remove some macros, introduce some inline functions
Message-Id: <1105187501.38159.1501675658122@ox.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee876334d7eb4af0d2277d0b9a61fdb6-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQDVFE=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
 <20170802115330.uvvzqrimbz2ixoyk@mwanda>
In-Reply-To: <20170802115330.uvvzqrimbz2ixoyk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org

Hi Dan,

I get your point and I understand, that there need to be rules to
simplify the life for the maintainers...

But I honestly must confess, that at the moment, I don't have the
time for doing that. I am into two customer projects, that keep me
very busy these weeks.

The only thing, I can offer, is to remove all the lines, dealing 
with the #ifdef DEBUG and leave the rest, as it is and send it again.
Then all other changes are related to the move from macro to inline...
If that helps, please let me know.

If it needs further fragmentation, it'll take something like half 
a day / a day. I most probably can spent that day end of August, 
begin of September the earliest.

Sorry,

Marcus

> Dan Carpenter <dan.carpenter@oracle.com> hat am 2. August 2017 um 13:53
> geschrieben:
>
>
> I'm afraid this patch is going to need to be divided into several
> patches that do one thing per patch. And I totally get that redoing
> patches sucks... Sorry.
>
> On Wed, Aug 02, 2017 at 01:10:14PM +0200, Wolf Entwicklungen wrote:
> > According to the proposal of Walter Harms, I removed some macros
> > and added some inline functions.
> >
> > Since I used a bit more intelligent interface, this enhances
> > readability and reduces problems with checkpatch.pl at the same time.
> >
> > In addition obsolete debug ifdefs were removed.
> >
> > Signed-off-by: Marcus Wolf <linux@wolf-entwicklungen.de>
> > ---
> > drivers/staging/pi433/rf69.c | 544
> > ++++++++++++++++++------------------------
> > 1 file changed, 238 insertions(+), 306 deletions(-)
> >
> > diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> > --- a/drivers/staging/pi433/rf69.c
> > +++ b/drivers/staging/pi433/rf69.c
> > @@ -28,33 +28,57 @@
> > #include "rf69.h"
> > #include "rf69_registers.h"
> >
> > -#define F_OSC 32000000 /* in Hz */
> > -#define FIFO_SIZE 66 /* in byte */
> > +#define F_OSC 32000000 /* in Hz */
> > +#define FIFO_SIZE 66 /* in byte */
>
>
> These are unrelated white space changes so they'll need to go in a
> separate patch.
>
> >
> > /*-------------------------------------------------------------------------*/
> >
> > -#define READ_REG(x) rf69_read_reg (spi, x)
> > -#define WRITE_REG(x,y) rf69_write_reg(spi, x, y)
> > #define INVALID_PARAM \
> > { \
> > dev_dbg(&spi->dev, "set: illegal input param"); \
> > return -EINVAL; \
> > }
> >
> > +inline static int setBit(struct spi_device *spi, u8 reg, u8 mask)
>
> Don't put "inline" on functions, let the compiler decide. setBit is
> camel case and also the name is probably too generic. Add a prefix so
> it's rf69_set_bits().
>
>
> > +{
> > + u8 tempVal;
>
> Camel case.
>
> > +
> > + tempVal = rf69_read_reg (spi, reg);
>
> No space before the '(' char.
>
> > + tempVal = tempVal | mask;
> > + return rf69_write_reg(spi, reg, tempVal);
> > +}
> > +
> > +inline static int rstBit(struct spi_device *spi, u8 reg, u8 mask)
>
> Maybe clear_bits is better than reset_bit.
>
> > +{
> > + u8 tempVal;
> > +
> > + tempVal = rf69_read_reg (spi, reg);
> > + tempVal = tempVal & ~mask;
> > + return rf69_write_reg(spi, reg, tempVal);
> > +}
> > +
> > +inline static int rmw(struct spi_device *spi, u8 reg, u8 mask, u8 value)
>
> What does rmw mean? Maybe just full words here or add a comment. I
> guess read_modify_write is too long...
>
>
> > +{
> > + u8 tempVal;
> > +
> > + tempVal = rf69_read_reg (spi, reg);
> > + tempVal = (tempVal & ~mask) | value;
> > + return rf69_write_reg(spi, reg, tempVal);
> > +}
> > +
> > /*-------------------------------------------------------------------------*/
> >
> > int rf69_set_mode(struct spi_device *spi, enum mode mode)
> > {
> > - #ifdef DEBUG
> > - dev_dbg(&spi->dev, "set: mode");
> > - #endif
> >
> > + dev_dbg(&spi->dev, "set: mode");
>
> This change is unrelated. Also just delete the line, because we can
> get the same information use ftrace instead.
>
> Anyway, I glanced through the rest of the patch and I think probably
> it should be broken up like this:
>
> [patch 1] add rf69_rmw() and convert callers
> [patch 2] add rf69_set_bit and rf69_clear_bit() and convert callers
> [patch 3] convert remaining callers to use rf69_read_reg() directly
> [patch 4] get rid of #ifdef debug, deleting code as appropriate
> [patch 5] other white space changes
>
> Greg is going to apply patches as they arrive on the email list, first
> come, first served. The problem is that some patches might have
> problems so you kind of have to guess which are good patches that he
> will apply and which are bad an then write your patch on top of that.
>
> Normally, I just write my patch based on linux-next and hope for the
> best. If I have to redo it because of conflicts, that's just part of
> the process. But my patches are normally small so they don't often
> conflict.
>
> regards,
> dan carpenter
>
>
