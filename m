From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Thu, 26 May 2016 04:59:46 +0000
Subject: Re: [PATCH 2/2] staging: dgnc: remove redundant null check in
Message-Id: <CAHb8M2DL51wvaw2J6ZuWR3s=oqcy8LbiKGrj7q=Tqo65PteE2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160520095128.GA30102@SEL-JYOUN-D1>
	<5746207C.6010000@osg.samsung.com>
In-Reply-To: <5746207C.6010000@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luis de Bethencourt <luisbg@osg.samsung.com>
Cc: Lidza Louina <lidza.louina@gmail.com>, devel <devel@driverdev.osuosl.org>, Greg KH <gregkh@linuxfoundation.org>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2016-05-26 7:00 GMT+09:00 Luis de Bethencourt <luisbg@osg.samsung.com>:
> On 20/05/16 10:51, Daeseok Youn wrote:
>> the "brd" was already checked for NULL before calling dgnc_do_remap().
>>
>> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>> ---
>>  drivers/staging/dgnc/dgnc_driver.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
>> index 22257d2..1882ef5 100644
>> --- a/drivers/staging/dgnc/dgnc_driver.c
>> +++ b/drivers/staging/dgnc/dgnc_driver.c
>> @@ -599,9 +599,6 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
>>   */
>>  static void dgnc_do_remap(struct dgnc_board *brd)
>>  {
>> -     if (!brd || brd->magic != DGNC_BOARD_MAGIC)
>> -             return;
>> -
>>       brd->re_map_membase = ioremap(brd->membase, 0x1000);
>>  }
>>
>>
>
> Same comment as the 1/2 patch.
I sent an e-mail from the 1/2 patch. it has same reason for this patch.

dgnc_do_remap() function is called twice only in dgnc_found_board() function.
and also DNGC_BOARD_MAGIC was assigned into "brd->magic".

So I think it doesn't need to check about DGNC_BOARD_MAGIC.

thanks
regards,
Daeseok.

>
> Do you want to keep the brd->magic != DGNC_BOARD_MAGIC check?
>
> Thanks,
> Luis
