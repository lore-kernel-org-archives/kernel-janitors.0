From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Thu, 24 Aug 2017 14:41:24 +0000
Subject: Re: Two rtlwifi drivers?
Message-Id: <652d42ad-a077-530b-743f-d38ddf3ff677@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170824100832.lcmbwcjhzwlgozeh@mwanda>
 <87h8wxw4bq.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87h8wxw4bq.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, Johannes Berg <johannes.berg@intel.com>, Souptick Joarder <jrdr.linux@gmail.com>, devel@driverdev.osuosl.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/24/2017 07:14 AM, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
>> Smatch is distrustful of the "capab" value and marks it as user
>> controlled.  I think it actually comes from the firmware?  Anyway, I
>> looked at other drivers and they added a bounds check and it seems like
>> a harmless thing to have so I have added it here as well.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/staging/rtlwifi/base.c b/drivers/staging/rtlwifi/base.c
>> index f7f207cbaee3..a30b928d5ee1 100644
>> --- a/drivers/staging/rtlwifi/base.c
>> +++ b/drivers/staging/rtlwifi/base.c
> 
> I'm getting slightly annoyed that we now apparently have two duplicate
> rtlwifi drivers (with the same name!) and I'm being spammed by staging
> patches. Was this really a smart thing to do? And what will be the
> future of these two drivers?
> 
> (Of course this is not directed to Dan, he is just fixing bugs found by
> smatch, but more like a general question.)

That was the decision that you and Greg made. The version in wireless-drivers 
needs many patches to handle the new device. The progress in applying these to 
wireless-drivers was very slow for many reasons. Keeping a single version of 
that code would have required coordination between you and Greg, which was 
discouraged.

The future, as stated in the TODO in staging, is to merge all the changes in the 
support drivers into wireless-drivers, and then move the new RTL8822BE driver 
out of staging.

I'm sorry about the fallout affecting you, and I probably should have changed 
the directory names. In any case, ignore any patches that belong in staging. If 
I see any that do not include GregKH in the "To" list, I will NACK them and 
request proper routing.

Larry
