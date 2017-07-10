From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 10 Jul 2017 15:32:26 +0000
Subject: Re: [PATCH] char/mwave: make some arrays static const to make object code smaller
Message-Id: <0dc756ce-1daa-f226-12ec-6e596d2ed23f@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710150832.28498-1-colin.king@canonical.com>
 <CAK8P3a0f++8E-JW1i-+OfrLpotaNydBKHpyK9CXFpwwZnrv0Zg@mail.gmail.com>
In-Reply-To: <CAK8P3a0f++8E-JW1i-+OfrLpotaNydBKHpyK9CXFpwwZnrv0Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 10/07/17 16:28, Arnd Bergmann wrote:
> On Mon, Jul 10, 2017 at 5:08 PM, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate arrays on the stack but make them static.  Makes
>> the object code smaller.  Also remove temporary variables that
>> have hard coded array sizes and just use ARRAY_SIZE instead and
>> wrap some lines that are wider than 80 chars to clean up some
>> checkpatch warnings.
>>
>> Before:
>>    text    data     bss     dec     hex filename
>>   11141    2008      64   13213    339d drivers/char/mwave/smapi.o
>>
>> After:
>>    text    data     bss     dec     hex filename
>>   10697    2352      64   13113    3339 drivers/char/mwave/smapi.o
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Did you use a particular tool that found these variables?

I'm using some grep foo and some targeted eyeballing.

> 
> I assume you are not actually using the driver ;-)
> 

