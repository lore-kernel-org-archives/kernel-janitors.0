From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Wed, 03 Jul 2019 09:53:46 +0000
Subject: Re: [PATCH] fs/seq_file: Replace a seq_printf() call by seq_puts() in seq_hex_dump()
Message-Id: <10744a9b-1c15-1581-8422-bbbf995c0da3@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8c295901-cdbd-a4a2-f23f-f63a58330f20@web.de>
In-Reply-To: <8c295901-cdbd-a4a2-f23f-f63a58330f20@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 02.07.19 18:38, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 Jul 2019 18:28:10 +0200
> 
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function “seq_puts”.

Looks good, but have you checked whether "m" could ever be NULL and
whether seq_puts() has a check for that ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
