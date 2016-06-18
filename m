From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 18 Jun 2016 08:54:28 +0000
Subject: Re: [patch] gpiolib: potential oops on failure path
Message-Id: <CACRpkda_yi08Nrkapz-00sb4HOze4J2nds92JnXroLK_7xNhwQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160617091550.GB25609@mwanda> <5763C2C1.8000505@bfs.de>
In-Reply-To: <5763C2C1.8000505@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jun 17, 2016 at 11:28 AM, walter harms <wharms@bfs.de> wrote:
> Am 17.06.2016 11:15, schrieb Dan Carpenter:

>>  out_free_descs:
>> +     if (i = GPIOHANDLES_MAX)
>> +             i--;
>>       for (; i >= 0; i--)
>>               gpiod_free(lh->descs[i]);
>>       kfree(lh->label);
>
>
> Since we have already noticed that programmes are bad at counting backwards
> is it possible to change the loop into counting up ?
>
> btw: if lh->descs[i] is initialized to NULL it would be more robust just to free everything like:
>
> for(i=0;i< GPIOHANDLES_MAX; i++)
>   gpiod_free(lh->descs[i]);
>
> just my two cents,

The loop looks like that for a reason: i is indexing upwards while
grabbing the descriptors, then it rewinds that way to free them if
something went wrong during init.

Yours,
Linus Walleij
