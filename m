From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Tue, 22 Mar 2016 07:17:33 +0000
Subject: Re: [PATCH 2/3] staging: dgnc: use pointer type of tty_struct
Message-Id: <CAHb8M2CBrHLFpHfMf3nkJZFD89qVfT-Lyaxi5RC_fqZhyi5AEw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160314042831.GA5760@SEL-JYOUN-D1>
 <20160321210506.GD9749@kroah.com>
In-Reply-To: <20160321210506.GD9749@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: devel <devel@driverdev.osuosl.org>, Lidza Louina <lidza.louina@gmail.com>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2016-03-22 6:05 GMT+09:00 Greg KH <gregkh@linuxfoundation.org>:
> On Mon, Mar 14, 2016 at 01:28:31PM +0900, Daeseok Youn wrote:
>> For using tty_alloc_driver, SerialDriver has to be pointer type.
>
> Yes, but you aren't calling tty_alloc_driver, so this patch totally
> breaks the working code :(
yes.. my changelog was NOT good enough to explain.
I was tried to make this patch based on "staging-testing branch" of
staging git tree.

Actually, I sent 3 patches
[1/3] staging: dgnc: fix camelcase of SerialDriver and PrintDriver
[2/3] staging: dgnc: use pointer type of tty_struct
[3/3] staging: dgnc: use tty_alloc_driver instead of kcalloc

without 1/3 patch set, it can break the working code..
(you left a comment on 1/3 and also it couldn't be taken.)
>
> Please be more careful...
Yes, I will be..
Sorry. :-(

I will resend a series of patches for this

thanks.
regards,
Daeseok.
>
> greg k-h
