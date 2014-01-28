From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Tue, 28 Jan 2014 16:25:26 +0000
Subject: Re: [patch] staging: r8821ae: a couple macro expansion bugs
Message-Id: <52E7D9F6.5070402@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140128140052.GA15759@elgon.mountain>
In-Reply-To: <20140128140052.GA15759@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/28/2014 09:01 AM, Greg Kroah-Hartman wrote:
> On Tue, Jan 28, 2014 at 05:46:30PM +0300, Dan Carpenter wrote:
>> On Tue, Jan 28, 2014 at 03:14:21PM +0100, walter harms wrote:
>>>
>>>
>>> Am 28.01.2014 15:00, schrieb Dan Carpenter:
>>>> These macros need parentheses, otherwise it causes a macro expansion bug
>>>> when they are used like this:
>>>>
>>>> 	ch->flags &= ~IEEE80211_CHAN_NO_IBSS;
>>>>
>>>> This was found using Smatch:
>>>> drivers/staging/rtl8821ae/regd.c:200 _rtl_reg_apply_beaconing_flags()
>>>> 	warn: the 'IEEE80211_CHAN_NO_IBSS' macro might need parens
>>>>
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>>
>>>> diff --git a/drivers/staging/rtl8821ae/regd.h b/drivers/staging/rtl8821ae/regd.h
>>>> index abc60ab8165c..dceb3f18200b 100644
>>>> --- a/drivers/staging/rtl8821ae/regd.h
>>>> +++ b/drivers/staging/rtl8821ae/regd.h
>>>> @@ -30,8 +30,8 @@
>>>>   #ifndef __RTL_REGD_H__
>>>>   #define __RTL_REGD_H__
>>>>
>>>> -#define IEEE80211_CHAN_NO_IBSS		1<<2
>>>> -#define IEEE80211_CHAN_PASSIVE_SCAN	1<<1
>>>> +#define IEEE80211_CHAN_NO_IBSS		(1 << 2)
>>>> +#define IEEE80211_CHAN_PASSIVE_SCAN	(1 << 1)
>>>>   #define WIPHY_FLAG_CUSTOM_REGULATORY	BIT(0)
>>>>   #define WIPHY_FLAG_STRICT_REGULATORY	BIT(1)
>>>>   #define WIPHY_FLAG_DISABLE_BEACON_HINTS	BIT(2)
>>>> --
>>>
>>>
>>> just one minor hint ...
>>> could we settle for a common semantic here either 1<<2 or BIT(2) ?
>>>
>>
>> Yeah...  This driver needs a lot of cleanup in later patches.
>
> That will happen soon, for 3.15, in the netdev tree, but for 3.14 we
> want this out there as people have the hardware and want to use it (i.e.
> me and 1000 others that got the hardware at a recent conference.)

Please clean this up as much as you want, but be aware that this is a temporary 
solution that was done in a hurry to handle some inconsistencies between 
staging-next and linux-next. Neither Smatch nor Sparse were run on that version. 
I suspect there are also endian issues that have not been repaired. I will be 
reading such E-mails and will include your fixes, but the major cleanup is being 
done on separate source.

Larry

