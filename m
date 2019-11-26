From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Date: Tue, 26 Nov 2019 09:16:10 +0000
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
Message-Id: <87h82ryp45.fsf@toke.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
 <87v9r7ysg0.fsf@toke.dk> <20191126091150.GA1759@kadam>
In-Reply-To: <20191126091150.GA1759@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Tue, Nov 26, 2019 at 09:04:15AM +0100, Toke Høiland-Jørgensen wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> 
>> > The sband->bitrates[] array has "sband->n_bitrates" elements so this
>> > check needs to be >= instead of > or we could read beyond the end of the
>> > array.
>> >
>> > These values come from when we call mt76_register_device():
>> >
>> > 	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
>> > 				   ARRAY_SIZE(mt7603_rates));
>> >
>> > Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
>> > ARRAY_SIZE()
>> >
>> > Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and survey")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> >  drivers/net/wireless/mediatek/mt76/airtime.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/net/wireless/mediatek/mt76/airtime.c b/drivers/net/wireless/mediatek/mt76/airtime.c
>> > index 55116f395f9a..a4a785467748 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/airtime.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/airtime.c
>> > @@ -242,7 +242,7 @@ u32 mt76_calc_rx_airtime(struct mt76_dev *dev, struct mt76_rx_status *status,
>> >  			return 0;
>> >  
>> >  		sband = dev->hw->wiphy->bands[status->band];
>> > -		if (!sband || status->rate_idx > sband->n_bitrates)
>> > +		if (!sband || status->rate_idx >= sband->n_bitrates)
>> >  			return 0;
>> >  
>> >  		rate = &sband->bitrates[status->rate_idx];
>> 
>> This code has recently been ported to mac80211 (net/mac80211/airtime.c).
>> It seems that the bug is also present there; care to send a patch for
>> that as well? :)
>
> Oh.  Thanks for pointing that out.  I actually saw the static checker
> warning for that and ignored it thinking that it was the same code.
> :P

Well, it's copy-pasted from the same code ;)

The plan is to get rid of the version inside mt76; was waiting for the
trees to converge, though, so I guess after the merge window?

> I will send a fix for it.

Great, thanks!

-Toke
