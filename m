From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 04 Sep 2019 06:05:44 +0000
Subject: Re: [PATCH][next] wil6210: fix wil_cid_valid with negative cid values
Message-Id: <20190904060544.C65D96115D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190702144026.13013-1-colin.king@canonical.com>
In-Reply-To: <20190702144026.13013-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Maya Erez <merez@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> There are several occasions where a negative cid value is passed
> into wil_cid_valid and this is converted into a u8 causing the
> range check of cid >= 0 to always succeed.  Fix this by making
> the cid argument an int to handle any -ve error value of cid.
> 
> An example of this behaviour is in wil_cfg80211_dump_station,
> where cid is assigned -ENOENT if the call to wil_find_cid_by_idx
> fails, and this -ve value is passed to wil_cid_valid.  I believe
> that the conversion of -ENOENT to the u8 value 254 which is
> greater than wil->max_assoc_sta causes wil_find_cid_by_idx to
> currently work fine, but I think is by luck and not the
> intended behaviour.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Maya Erez <merez@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

23bb9f692b66 wil6210: fix wil_cid_valid with negative cid values

-- 
https://patchwork.kernel.org/patch/11027989/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
