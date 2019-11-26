From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 26 Nov 2019 09:23:03 +0000
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
Message-Id: <0101016ea705771d-08dd7963-f8f7-447a-a0fb-4ad9093ec24d-000000@us-west-2.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
        <87v9r7ysg0.fsf@toke.dk> <20191126091150.GA1759@kadam>
        <87h82ryp45.fsf@toke.dk>
In-Reply-To: <87h82ryp45.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
        "Tue, 26 Nov 2019 10:16:10 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Roy Luo <royluo@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

Toke Høiland-Jørgensen <toke@redhat.com> writes:

> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
>> On Tue, Nov 26, 2019 at 09:04:15AM +0100, Toke Høiland-Jørgensen wrote:
>>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>>> 
>>> > @@ -242,7 +242,7 @@ u32 mt76_calc_rx_airtime(struct mt76_dev *dev, struct mt76_rx_status *status,
>>> >  			return 0;
>>> >  
>>> >  		sband = dev->hw->wiphy->bands[status->band];
>>> > -		if (!sband || status->rate_idx > sband->n_bitrates)
>>> > +		if (!sband || status->rate_idx >= sband->n_bitrates)
>>> >  			return 0;
>>> >  
>>> >  		rate = &sband->bitrates[status->rate_idx];
>>> 
>>> This code has recently been ported to mac80211 (net/mac80211/airtime.c).
>>> It seems that the bug is also present there; care to send a patch for
>>> that as well? :)
>>
>> Oh.  Thanks for pointing that out.  I actually saw the static checker
>> warning for that and ignored it thinking that it was the same code.
>> :P
>
> Well, it's copy-pasted from the same code ;)
>
> The plan is to get rid of the version inside mt76; was waiting for the
> trees to converge, though, so I guess after the merge window?

Yup, as I'm not taking anything to w-d-next until -rc1 is released.

-- 
Kalle Valo
