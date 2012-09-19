From: Lars-Peter Clausen <lars@metafoo.de>
Date: Wed, 19 Sep 2012 19:15:17 +0000
Subject: Re: [staging:staging-next 86/151] drivers/staging/iio/iio_hwmon.c:96:21-27: ERROR: application of si
Message-Id: <505A19C5.7070806@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919163132.GA596@localhost>
In-Reply-To: <20120919163132.GA596@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 09/19/2012 07:19 PM, Fengguang Wu wrote:
> On Wed, Sep 19, 2012 at 07:06:39PM +0200, Lars-Peter Clausen wrote:
>> On 09/19/2012 06:31 PM, Fengguang Wu wrote:
>>> Hi Lars-Peter,
>>>
>>> FYI, there are new coccinelle warnings show up in
>>>
>>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
>>> head:   5d06e3df280bd230e2eadc16372e62818c63e894
>>> commit: a0e545e0e75006a7de0e9bc5397f6b44c61990b2 [86/151] staging:iio:hwmon bridge: Use iio_read_channel_processed
>>
>> Hi,
>>
>> Thanks for info, patch looks good, but the warning is not introduced by the
>> commit you mention, though.
> 
> Sorry! I should probably change the prompt message accordingly,
> especially removing the word "new". Because I'm reporting new as
> well as old coccinelle warnings:
> 
> In fact I've never run a complete coccinelle check, mark all existing
> warnings as "old" and ignore them.  It feels not good to ignore all
> existing problems in that way. On the other hand, it's also not
> feasible to check/fix all of them in one day.
> 
> So I decided to report old/new coccinelle warnings for the files
> touched by new commits. Which looks like the most manageable way.
> However it means the below message is not always accurate and
> sometimes I forgot to change it accordingly:
> 

Ok. I think for IIO I'll just go through all the existing warnings and fix
them, that should avoid old warnings with new patches.

- Lars
