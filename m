From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 17:19:19 +0000
Subject: Re: [staging:staging-next 86/151] drivers/staging/iio/iio_hwmon.c:96:21-27: ERROR: application of si
Message-Id: <20120919171919.GA3070@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919163132.GA596@localhost>
In-Reply-To: <20120919163132.GA596@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 19, 2012 at 07:06:39PM +0200, Lars-Peter Clausen wrote:
> On 09/19/2012 06:31 PM, Fengguang Wu wrote:
> > Hi Lars-Peter,
> > 
> > FYI, there are new coccinelle warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
> > head:   5d06e3df280bd230e2eadc16372e62818c63e894
> > commit: a0e545e0e75006a7de0e9bc5397f6b44c61990b2 [86/151] staging:iio:hwmon bridge: Use iio_read_channel_processed
> 
> Hi,
> 
> Thanks for info, patch looks good, but the warning is not introduced by the
> commit you mention, though.

Sorry! I should probably change the prompt message accordingly,
especially removing the word "new". Because I'm reporting new as
well as old coccinelle warnings:

In fact I've never run a complete coccinelle check, mark all existing
warnings as "old" and ignore them.  It feels not good to ignore all
existing problems in that way. On the other hand, it's also not
feasible to check/fix all of them in one day.

So I decided to report old/new coccinelle warnings for the files
touched by new commits. Which looks like the most manageable way.
However it means the below message is not always accurate and
sometimes I forgot to change it accordingly:

> > FYI, there are new coccinelle warnings show up in

Thanks,
Fengguang

> > All coccinelle warnings:
> > 
> > + drivers/staging/iio/iio_hwmon.c:96:21-27: ERROR: application of sizeof to pointer
> > 
> > vim +96 drivers/staging/iio/iio_hwmon.c
> >     86		st->channels = iio_channel_get_all(dev_name(&pdev->dev));
> >     87		if (IS_ERR(st->channels)) {
> >     88			ret = PTR_ERR(st->channels);
> >     89			goto error_free_state;
> >     90		}
> >     91	
> >     92		/* count how many attributes we have */
> >     93		while (st->channels[st->num_channels].indio_dev)
> >     94			st->num_channels++;
> >     95	
> >   > 96		st->attrs = kzalloc(sizeof(st->attrs) * (st->num_channels + 1),
> >     97				    GFP_KERNEL);
> >     98		if (st->attrs = NULL) {
> >     99			ret = -ENOMEM;
> >    100			goto error_release_channels;
> >    101		}
> >    102		for (i = 0; i < st->num_channels; i++) {
> >    103			a = kzalloc(sizeof(*a), GFP_KERNEL);
> >    104			if (a = NULL) {
> >    105				ret = -ENOMEM;
> >    106				goto error_free_attrs;
> > 
> > Please consider folding the attached diff :-)
> > 
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu, Yuanhan Liu                              Intel Corporation
