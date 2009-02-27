From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 27 Feb 2009 05:07:15 +0000
Subject: Re: [PATCH 06/16] MTD: tests: fix sparse warnings: Using plain 	integer
Message-Id: <49A77503.8040900@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>	 <20090222000216.17557.92413.stgit@vmbox.hanneseder.net> <154e089b0902261702r52432481q6a0561de9576ed71@mail.gmail.com>
In-Reply-To: <154e089b0902261702r52432481q6a0561de9576ed71@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: "trivial@kernel.org" <trivial@kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hannes Eder wrote:
> [Added To]
> 
> On Sun, Feb 22, 2009 at 1:02 AM, Hannes Eder <hannes@hanneseder.net> wrote:
>> Fix this sparse warnings:
>>  drivers/mtd/tests/mtd_oobtest.c:139:33: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:192:33: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:219:41: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:284:25: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:525:25: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:545:25: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:569:33: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:589:33: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:613:33: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:633:33: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:673:41: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_oobtest.c:701:33: warning: Using plain integer as NULL pointer
>>  drivers/mtd/tests/mtd_readtest.c:74:41: warning: Using plain integer as NULL pointer
>>
>> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
