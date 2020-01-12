From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 12 Jan 2020 08:30:42 +0000
Subject: Re: [PATCH v3] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <6cc0c851-7a32-d82a-1c0c-51a08538b445@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110131526.60180-1-wenyang@linux.alibaba.com>
In-Reply-To: <20200110131526.60180-1-wenyang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>

> This semantic patch is inspired by Mateusz Guzik's patch:

Does such a wording mean also that you would like to support the operation mode “patch”
by this SmPL script?

Regards,
Markus
