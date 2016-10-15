From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Sat, 15 Oct 2016 22:09:02 +0000
Subject: Re: [patch 2/2] mtd: spi-nor: Fix some error codes in cqspi_setup_flash()
Message-Id: <CAAtXAHey9fxQJ12=xt8jd4ZYTsYLs8s-TJ=YS=ob8CB03mnXpA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013080857.GC3389@mwanda>
 <3ebab16e-ddf8-0a4b-aaaf-d5b424720eb2@denx.de>
In-Reply-To: <3ebab16e-ddf8-0a4b-aaaf-d5b424720eb2@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Vasut <marex@denx.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org

On Fri, Oct 14, 2016 at 9:16 AM, Marek Vasut <marex@denx.de> wrote:
> On 10/13/2016 10:30 AM, Dan Carpenter wrote:
>> We return success or possibly uninitialized values on these error paths
>> instead of proper error codes.
>>
>> Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>
> Nice
>
> Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>

Thanks,

Moritz
