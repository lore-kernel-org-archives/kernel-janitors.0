From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 08 Feb 2017 09:01:36 +0000
Subject: Re: [patch] ASoC: sun4i-i2s: remove some dead code
Message-Id: <CAGb2v67m5n4R+7jSpTq=_BYN1wFP=vwnPWSq6aCKmcyx8M7Jjw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131934.GD28207@mwanda>
 <20170207134215.f47cufvs7tngrabk@lukather>
 <20170207135008.GL11103@mwanda> <20170208085841.rilib45uhwgu24j4@lukather>
In-Reply-To: <20170208085841.rilib45uhwgu24j4@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Feb 8, 2017 at 4:58 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Tue, Feb 07, 2017 at 04:50:08PM +0300, Dan Carpenter wrote:
>> On Tue, Feb 07, 2017 at 02:42:15PM +0100, Maxime Ripard wrote:
>> > > - if (!IS_ERR(i2s->rst)) {
>> > > -         ret = reset_control_deassert(i2s->rst);
>> > > -         if (ret) {
>> > > -                 dev_err(&pdev->dev,
>> > > -                         "Failed to deassert the reset control\n");
>> > > -                 return -EINVAL;
>> > > -         }
>> > > + ret = reset_control_deassert(i2s->rst);
>> > > + if (ret) {
>> > > +         dev_err(&pdev->dev,
>> > > +                 "Failed to deassert the reset control\n");
>> > > +         return -EINVAL;
>> >
>> > In the case where has_reset is false, rst is NULL and will trigger a
>> > WARN_ON in reset_control_deassert.
>> >
>>
>> No it won't.  reset_control_deassert(NULL) just returns success
>> immediately.
>
> Not in current Linus' tree at least:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/reset/core.c#n217

The changes were just pulled into arm-soc. I suggest waiting for -rc1 at least
before merging this change.

ChenYu
