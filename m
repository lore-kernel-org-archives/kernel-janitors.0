From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 Mar 2018 18:48:21 +0000
Subject: Re: [PATCH 1/2] net/usb/ax88179_178a: Use common code in ax88179_chk_eee()
Message-Id: <CAHp75VfJQPUsfJ14MvoJiN4S72EaNXdf1K+ahdZ8pX3qOFMkEw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a7fff45f-4426-ec33-8b8d-caf1e3a9f0be@users.sourceforge.net>
In-Reply-To: <a7fff45f-4426-ec33-8b8d-caf1e3a9f0be@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, USB <linux-usb@vger.kernel.org>, netdev <netdev@vger.kernel.org>, "Andrew F. Davis" <afd@ti.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Yuval Shaia <yuval.shaia@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Mar 10, 2018 at 8:41 PM, Joe Perches <joe@perches.com> wrote:
> On Sat, 2018-03-10 at 19:24 +0100, SF Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Sat, 10 Mar 2018 18:22:43 +0100
>>
>> Adjust a jump target so that a bit of common code can be better reused
>> at the end of this function.
>
> Please stop mindlessly sending patching Markus.
>
> How about looking at the code being modified and
> thinking about what it does?

You have a strong nerve, I gave up on him and would rather simple ban.

-- 
With Best Regards,
Andy Shevchenko
