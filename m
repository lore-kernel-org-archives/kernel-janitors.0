From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 24 Aug 2017 12:14:17 +0000
Subject: Two rtlwifi drivers?
Message-Id: <87h8wxw4bq.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170824100832.lcmbwcjhzwlgozeh@mwanda>
In-Reply-To: <20170824100832.lcmbwcjhzwlgozeh@mwanda> (Dan Carpenter's message
        of "Thu, 24 Aug 2017 13:08:32 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, Johannes Berg <johannes.berg@intel.com>, Souptick Joarder <jrdr.linux@gmail.com>, devel@driverdev.osuosl.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Smatch is distrustful of the "capab" value and marks it as user
> controlled.  I think it actually comes from the firmware?  Anyway, I
> looked at other drivers and they added a bounds check and it seems like
> a harmless thing to have so I have added it here as well.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/rtlwifi/base.c b/drivers/staging/rtlwifi/base.c
> index f7f207cbaee3..a30b928d5ee1 100644
> --- a/drivers/staging/rtlwifi/base.c
> +++ b/drivers/staging/rtlwifi/base.c

I'm getting slightly annoyed that we now apparently have two duplicate
rtlwifi drivers (with the same name!) and I'm being spammed by staging
patches. Was this really a smart thing to do? And what will be the
future of these two drivers?

(Of course this is not directed to Dan, he is just fixing bugs found by
smatch, but more like a general question.)

-- 
Kalle Valo
