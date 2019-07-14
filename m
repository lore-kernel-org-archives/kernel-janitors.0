From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jul 2019 14:42:11 +0000
Subject: Re: [v3] staging: most: remove redundant print statement when kfifo_alloc fails
Message-Id: <27df9bec-dbd5-8267-8df2-4948ca14e6d4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190711175055.25157-1-iamkeyur96@gmail.com>
In-Reply-To: <20190711175055.25157-1-iamkeyur96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Keyur Patel <iamkeyur96@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Cc: Christian Gromm <christian.gromm@microchip.com>, Suresh Udipi <sudipi@jp.adit-jv.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Colin Ian King <colin.king@canonical.com>

> This print statement is redundant as kfifo_alloc just calls kmalloc_array
> and without the __GFP_NOWARN flag, already does a dump_stack().

I suggest to omit the word “and” from this sentence.
Will any further wording adjustments become helpful for commit descriptions?


> Changes in v3:
> - fix checkpatch warrning
> ---

Please move such version information below the triple dashes without a typo.

Regards,
Markus
