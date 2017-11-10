From: Marcus Wolf <marcus.wolf@smarthome-wolf.de>
Date: Fri, 10 Nov 2017 17:14:48 +0000
Subject: Re: [PATCH] staging: pi433: fix missing break in switch statement.
Message-Id: <3bedae57-780a-7baf-ab2c-739d5990fe3f@smarthome-wolf.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109171955.10911-1-colin.king@canonical.com>
 <a65c3bd2-64d0-0161-b934-0d8d849af766@smarthome-wolf.de>
 <e2ab2dae-f367-0984-088b-0a05d8cc6327@canonical.com>
In-Reply-To: <e2ab2dae-f367-0984-088b-0a05d8cc6327@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin Ian King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, Al Viro <viro@zeniv.linux.org.uk>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

thanks for clarification.

Should I switch to that repo for further work, too?

If so, can anybody provide me the link?

Do I need Gregs staging any longer, or is it kind of dead for devel on
pi433 driver?

Thank you so much!

Marcus

Am 10.11.2017 um 18:04 schrieb Colin Ian King:
> On 10/11/17 16:49, Marcus Wolf wrote:
>> Hi all!
>>
>> Tryed to cross check...
>>
>> Don't get it, sorry.
>>
>> On my private version control (my SVN), where I initially developed the
>> driver the break isn't missing.
>> Same with my git copy of Gregs staging tree. Break is there...
>>
>> Who removed it, why is it missing in Colins copy?
>>
>> Am I working on a wrong version?
> 
> I was working on the latest, that got landed into linux-next. This had
> picked up some modifications from Al-Viro.
> 
> Hope that clarifies things
> 
> Colin
> 
>>
>> marcus@Laptop-Wolf:~/staging/drivers/staging/pi433$ git remote show origin
>> * remote origin
>>   Fetch URL:
>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>>   Push  URL:
>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>>
>>
>> Can anybody help me?
>>
>> Thanks,
>>
>> Marcus
>>
>>
>> Am 09.11.2017 um 19:19 schrieb Colin King:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The PI433_IOC_WR_RX_CFG case is missing a break and will fall through
>>> to the default case and errorenously return -EINVAL. Fix this by
>>> adding in missing break.
>>>
>>> Detected by CoverityScan, CID#1461286 ("Missing break in switch")
>>>
>>> Fixes: f81f0b5c9a30 ("pi433: sanitize ioctl")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>   drivers/staging/pi433/pi433_if.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/staging/pi433/pi433_if.c
>>> b/drivers/staging/pi433/pi433_if.c
>>> index 3bcb59811cdf..a960fe2e7875 100644
>>> --- a/drivers/staging/pi433/pi433_if.c
>>> +++ b/drivers/staging/pi433/pi433_if.c
>>> @@ -811,6 +811,7 @@ pi433_ioctl(struct file *filp, unsigned int cmd,
>>> unsigned long arg)
>>>           }
>>>             mutex_unlock(&device->rx_lock);
>>> +        break;
>>>       default:
>>>           retval = -EINVAL;
>>>       }
>>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe
>> kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
