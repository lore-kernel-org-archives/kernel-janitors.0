From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jun 2020 15:07:33 +0000
Subject: Re: [PATCH] exfat: Fix use after free in exfat_load_upcase_table()
Message-Id: <9b9272fb-b265-010b-0696-4c0579abd841@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, Tetsuhiro Kohada <kohada.t2@gmail.com>

> This code calls brelse(bh) and then dereferences "bh" on the next line
> resulting in a possible use after free.

There is an unfortunate function call sequence.


> The brelse() should just be moved down a line.

How do you think about a wording variant like the following?

   Thus move a call of the function “brelse” one line down.


Would you like to omit a word from the patch subject so that
a typo will be avoided there?

Regards,
Markus
