From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jun 2020 20:07:12 +0000
Subject: Re: exfat: Fix use after free in exfat_load_upcase_table()
Message-Id: <6ae85a8e-2cb6-214c-0bd9-5dd1ee949437@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b9272fb-b265-010b-0696-4c0579abd841@web.de>
 <20200608155243.GX19604@bombadil.infradead.org>
In-Reply-To: <20200608155243.GX19604@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Matthew Wilcox <willy@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, Tetsuhiro Kohada <kohada.t2@gmail.com>

>>> The brelse() should just be moved down a line.
>>
>> How do you think about a wording variant like the following?
>>
>>    Thus move a call of the function “brelse” one line down.
>>
>>
>> Would you like to omit a word from the patch subject so that
>> a typo will be avoided there?
>
> Markus, please go away.  This comment is entirely unhelpful.

I hope that other contributors can get also more positive impressions
(as it happened before).

Regards,
Markus
