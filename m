From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Tue, 14 Mar 2017 01:44:50 +0000
Subject: Re: [PATCH 3/3] staging: dngc: ch->ch_bd is already assigned to bd variable
Message-Id: <CAHb8M2CyT3kVB_WTZKL5rUYXDPfSua6oVCz5Put=625TgGfWhw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170312144727.GA24031@jyoun-Latitude-E6530>
 <20170313222611.GA23550@kroah.com>
In-Reply-To: <20170313222611.GA23550@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: devel <devel@driverdev.osuosl.org>, Lidza Louina <lidza.louina@gmail.com>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2017-03-14 7:26 GMT+09:00 Greg KH <gregkh@linuxfoundation.org>:
> On Sun, Mar 12, 2017 at 11:47:28PM +0900, Daeseok Youn wrote:
>> The bd variable in dgnc_tty_digiseta() is assigned with
>> ch->ch_bd but it is not used in this function except checking NULL.
>> The ch->ch_bd could be replaced with bd variable in dgnc_tty_digiseta()
>>
>> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>> ---
>>  drivers/staging/dgnc/dgnc_tty.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Please merge this with your first patch in the series and resend them.
Hi Greg,

Ok. I will merge this with my first patch and send them.

Thanks,
Regards,
Daeseok Youn.

>
> thanks,
>
> greg k-h
