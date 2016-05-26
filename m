From: Luis de Bethencourt <luisbg@osg.samsung.com>
Date: Thu, 26 May 2016 12:29:10 +0000
Subject: Re: [PATCH 1/2] staging: dgnc: remove redundant NULL check for brd
Message-Id: <5746EC16.2050504@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160520095104.GA30075@SEL-JYOUN-D1> <57461D94.1030403@osg.samsung.com> <CAHb8M2D87SXj6R4Z11ScOJkcpd-C7O4V6YU1Lz3yRu3F9UYuow@mail.gmail.com>
In-Reply-To: <CAHb8M2D87SXj6R4Z11ScOJkcpd-C7O4V6YU1Lz3yRu3F9UYuow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DaeSeok Youn <daeseok.youn@gmail.com>
Cc: Lidza Louina <lidza.louina@gmail.com>, devel <devel@driverdev.osuosl.org>, Greg KH <gregkh@linuxfoundation.org>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On 26/05/16 05:56, DaeSeok Youn wrote:
> 2016-05-26 6:48 GMT+09:00 Luis de Bethencourt <luisbg@osg.samsung.com>:
>> On 20/05/16 10:51, Daeseok Youn wrote:
>>> the "brd" value cannot be NULL in dgnc_finalize_board_init().
>>> Because "brd" as a parameter of this function was already
>>> checked for NULL.
>>>
>>> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>>> ---
>>>  drivers/staging/dgnc/dgnc_driver.c | 3 ---
>>>  1 file changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
>>> index af2e835..22257d2 100644
>>> --- a/drivers/staging/dgnc/dgnc_driver.c
>>> +++ b/drivers/staging/dgnc/dgnc_driver.c
>>> @@ -579,9 +579,6 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
>>>  {
>>>       int rc = 0;
>>>
>>> -     if (!brd || brd->magic != DGNC_BOARD_MAGIC)
>>> -             return -ENODEV;
>>> -
>>>       if (brd->irq) {
>>>               rc = request_irq(brd->irq, brd->bd_ops->intr,
>>>                                IRQF_SHARED, "DGNC", brd);
>>>
>>
>> This is partially correct, the check for brd being NULL is in line 371.
> Hi Luis,
> 
> Yes, right. but also brd was assigned the value DGNC_BOARD_MAGIC in line 384.
> brd->magic = DGNC_BOARD_MAGIC;
> and also dgnc_finalize_board_init() as a static function is only
> called in dgnc_found_board(), right?
> 
>>
>> But there is a second check for brd->magic != DGNC_BOARD_MAGIC. Do you want
>> to keep that one?
> So.. I think it doesn't need to check about DGNC_BOARD_MAGIC.

This is good. I was asking just to make sure it was your intention.

Please add the reason to drop that second check in the commit message as well. So people
reading the git log can understand both parts. For both patches.

Thanks for the fixes :)

Luis

> 
>>
>> Also, how did you find this patch. It is useful to mention this in the commit
>> message if it was through some static analysis tool. For people using these tools
>> in the future.
> There are some static analysis tool for checking linux kernel code.
> But I didn't use
> those tools for this patch. sometimes, I usually run "smatch" tool for
> checking linux kernel
> code.
> 
> thanks.
> regards,
> Daeseok.
> 
>>
>> Thanks for the patch :)
>> Luis

