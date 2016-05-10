From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Tue, 10 May 2016 01:17:09 +0000
Subject: Re: [PATCH 1/3] staging: dgnc: remove redundant NULL check in
Message-Id: <CAHb8M2BTsHJF3pgPDtV7pmWZ-ycvcG80LNj0VgBx5ddioUPO9w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160504051304.GA20929@certreview.com>
 <20160509120849.GA5302@kroah.com>
In-Reply-To: <20160509120849.GA5302@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: devel <devel@driverdev.osuosl.org>, Lidza Louina <lidza.louina@gmail.com>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2016-05-09 21:08 GMT+09:00 Greg KH <gregkh@linuxfoundation.org>:
> On Wed, May 04, 2016 at 02:13:04PM +0900, Daeseok Youn wrote:
>> tty and ch are already checked for NULL
>> before calling dgnc_block_til_ready().
>>
>> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>
> Your subject line doesn't make sense, please fix it up and resend.
OK. I will resend this.

thanks

regards,
Daeseok.

>
> thanks,
>
> greg k-h
