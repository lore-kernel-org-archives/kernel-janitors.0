From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Date: Tue, 26 Nov 2019 12:39:28 +0000
Subject: Re: [PATCH] mac80211: airtime: Fix an off by one in ieee80211_calc_rx_airtime()
Message-Id: <87wobmyfpb.fsf@toke.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
In-Reply-To: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This code was copied from mt76 and inherited an off by one bug from
> there.  The > should be >= so that we don't read one element beyond
> the end of the array.
>
> Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76")
> Reported-by: Toke Høiland-Jørgensen <toke@redhat.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks!

Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>
