From: "John W. Linville" <linville@tuxdriver.com>
Date: Wed, 27 Feb 2008 00:59:28 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct
Message-Id: <20080227005928.GA3066@tuxdriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk> <1ba2fa240802261447udd3ff92t20aba416362d5e33@mail.gmail.com>
In-Reply-To: <1ba2fa240802261447udd3ff92t20aba416362d5e33@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomasw@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, yi.zhu@intel.com, linux-wireless@vger.kernel.org, ipw3945-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 27, 2008 at 12:47:56AM +0200, Tomas Winkler wrote:

> >  diff -u -p a/drivers/net/wireless/iwlwifi/iwl-4965.c b/drivers/net/wireless/iwlwifi/iwl-4965.c
> >  --- a/drivers/net/wireless/iwlwifi/iwl-4965.c 2008-02-05 20:56:01.000000000 +0100
> >  +++ b/drivers/net/wireless/iwlwifi/iwl-4965.c 2008-02-26 08:09:12.000000000 +0100
> >  @@ -4589,7 +4589,7 @@ static u8 iwl4965_is_fat_tx_allowed(stru
> >
> >         if (sta_ht_inf) {
> >                 if ((!sta_ht_inf->ht_supported) ||
> >  -                  (!sta_ht_inf->cap & IEEE80211_HT_CAP_SUP_WIDTH))
> >  +                  (!(sta_ht_inf->cap & IEEE80211_HT_CAP_SUP_WIDTH)))
> >                         return 0;
> >         }
> 
> The patch was already submitted by Roel Kluin '[PATCH]
> [wireless/iwlwifi/iwl-4965.c] add parentheses' I've acked it.
> Didn't track it if it's actually committed into tree... John, Reinette ?

Already merged and sent to davem...

Thanks,

John
-- 
John W. Linville
linville@tuxdriver.com
