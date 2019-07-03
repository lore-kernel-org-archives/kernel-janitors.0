From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 11:01:30 +0000
Subject: Re: fs/seq_file: Replace a seq_printf() call by seq_puts() in seq_hex_dump()
Message-Id: <f62fdb13-59b7-4e5d-b64a-37b96b5c0125@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8c295901-cdbd-a4a2-f23f-f63a58330f20@web.de>
 <10744a9b-1c15-1581-8422-bbbf995c0da3@metux.net>
In-Reply-To: <10744a9b-1c15-1581-8422-bbbf995c0da3@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <lkml@metux.net>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Looks good,

Thanks for your feedback.


> but have you checked whether "m" could ever be NULL

I wonder about this enquiry.

This function parameter should be valid as usual.
Thus it should not be a null pointer under ordinary conditions.


> and whether seq_puts() has a check for that ?

These output functions do not provide an explicit sanity check for their first parameter
so far.

Regards,
Markus
