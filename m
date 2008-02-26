From: "Tomas Winkler" <tomasw@gmail.com>
Date: Tue, 26 Feb 2008 22:47:56 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct use of.and &
Message-Id: <1ba2fa240802261447udd3ff92t20aba416362d5e33@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: yi.zhu@intel.com, linux-wireless@vger.kernel.org, ipw3945-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 26, 2008 at 10:44 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
>  In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed that
>  involved converting !x & y to !(x & y).  The code below shows the same
>  pattern, and thus should perhaps be fixed in the same way.
>
>  This is not tested and clearly changes the semantics, so it is only
>  something to consider.
>
>  The semantic patch that makes this change is as follows:
>  (http://www.emn.fr/x-info/coccinelle/)
>
>  // <smpl>
>  @@ expression E1,E2; @@
>  (
>   !E1 & !E2
>  |
>  - !E1 & E2
>  + !(E1 & E2)
>  )
>  // </smpl>
>
>  Signed-off-by: Julia Lawall <julia@diku.dk>
>
>  ---
>
>  diff -u -p a/drivers/net/wireless/iwlwifi/iwl-4965.c b/drivers/net/wireless/iwlwifi/iwl-4965.c
>  --- a/drivers/net/wireless/iwlwifi/iwl-4965.c 2008-02-05 20:56:01.000000000 +0100
>  +++ b/drivers/net/wireless/iwlwifi/iwl-4965.c 2008-02-26 08:09:12.000000000 +0100
>  @@ -4589,7 +4589,7 @@ static u8 iwl4965_is_fat_tx_allowed(stru
>
>         if (sta_ht_inf) {
>                 if ((!sta_ht_inf->ht_supported) ||
>  -                  (!sta_ht_inf->cap & IEEE80211_HT_CAP_SUP_WIDTH))
>  +                  (!(sta_ht_inf->cap & IEEE80211_HT_CAP_SUP_WIDTH)))
>                         return 0;
>         }

The patch was already submitted by Roel Kluin '[PATCH]
[wireless/iwlwifi/iwl-4965.c] add parentheses' I've acked it.
Didn't track it if it's actually committed into tree... John, Reinette ?

Thanks
Tomas


>  -
>  To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
>  the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
