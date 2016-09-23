From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Fri, 23 Sep 2016 01:18:45 +0000
Subject: Re: [PATCH 04/11] staging: dgnc: kfree for board structure in
Message-Id: <CAHb8M2DLbiqhsA0GeK3zYs61Xz__KQ3FRQ1SdPQxpfUtA95_FA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160922052203.GA27209@SEL-JYOUN-D1> <20160922072118.GC4333@kroah.com>
In-Reply-To: <20160922072118.GC4333@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Lidza Louina <lidza.louina@gmail.com>, devel <devel@driverdev.osuosl.org>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2016-09-22 16:21 GMT+09:00 Greg KH <gregkh@linuxfoundation.org>:
> On Thu, Sep 22, 2016 at 02:22:03PM +0900, Daeseok Youn wrote:
>> The board structure should be freed when any function was failed
>> in dgnc_found_board(). And the board strucure will be stored
>> into dgnc_board array when the dgnc_found_board() function has no error.
>>
>> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>> ---
>>  drivers/staging/dgnc/dgnc_driver.c | 17 +++++++++--------
>>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> Another shortened subject line.
I am not sure why the subject line was cut off.
I will fix them up and resend.

Thanks.
Regards,
Daeseok.
>
> Please look at all of the subjects in this series, fix them up, and
> resend.
>
> thanks,
>
> greg k-h
