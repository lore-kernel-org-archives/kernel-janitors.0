From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Fri, 15 Feb 2013 12:54:56 +0000
Subject: Re: [patch] USB: chipidea: fix & vs | bug
Message-Id: <87haldag9r.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914065056.GA11886@elgon.mountain>
In-Reply-To: <20120914065056.GA11886@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Fri, Feb 15, 2013 at 01:26:29PM +0300, Dan Carpenter wrote:
>> On Fri, Sep 14, 2012 at 02:58:20PM +0800, Richard Zhao wrote:
>> > On Fri, Sep 14, 2012 at 09:50:56AM +0300, Dan Carpenter wrote:
>> > > There is a '&' vs '|' typo in the original code so the condition is
>> > > never true and we don't queue the work.
>> > > 
>> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > > ---
>> > > 
>> > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
>> > > index 2f45bba..5294f81 100644
>> > > --- a/drivers/usb/chipidea/udc.c
>> > > +++ b/drivers/usb/chipidea/udc.c
>> > > @@ -1680,7 +1680,7 @@ static irqreturn_t udc_irq(struct ci13xxx *ci)
>> > >  	intr = hw_read(ci, OP_OTGSC, ~0);
>> > >  	hw_write(ci, OP_OTGSC, ~0, intr);
>> > >  
>> > > -	if (intr & (OTGSC_AVVIE & OTGSC_AVVIS))
>> > > +	if (intr & (OTGSC_AVVIE | OTGSC_AVVIS))
>> > It's not what I meant. Should be
>> > if ((intr & OTGSC_AVVIE) && (intr & OTGSC_AVVIS))
>> > I'm still testing it.
>> 
>> How did the testing go?
>>
>
> Richard's email is bouncing.  Probably I should just send this
> myself.

We're reverting this commit for 3.10 as part of Peter's vbus detection
patchset. If it seems more urgent, I guess we can revert it earlier as a
bugfix. Otherwise, I'd just leave it till 3.10.

Regards,
--
Alex
