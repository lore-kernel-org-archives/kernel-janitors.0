From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 16:28:40 +0000
Subject: Re: md-multipath: Replace a seq_printf() call by seq_putc() in multipath_status()
Message-Id: <3ae39471-e1d2-2e2a-984a-888340e84447@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ad2e4b58-268e-c9e5-8a66-8cb5dee8d91e@web.de>
 <CAPhsuW7CAfu07Y319eHUUi3Ln422-jMmpTHmy0rT+MxZnO8BBA@mail.gmail.com>
In-Reply-To: <CAPhsuW7CAfu07Y319eHUUi3Ln422-jMmpTHmy0rT+MxZnO8BBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Song Liu <liu.song.a23@gmail.com>, linux-raid <linux-raid@vger.kernel.org>
Cc: Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> A single character (depending on a condition check) should be put
>> into a sequence. Thus use the corresponding function “seq_putc”.
…
> Can you explain why this is necessary?

I suggest another bit of software fine-tuning.

* Pass only a relevant character instead of a string.

* Omit the format string for a function parameter.

Regards,
Markus
