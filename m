From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 16 Feb 2019 18:39:56 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <52c3fdf6-0d04-eed5-da57-ef7d1008c291@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <yellowriver2010@hotmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

> In a function, for a local variable obtained by of_find_device_by_node(),

I got a software understanding where such a variable can not be obtained
from this function call.
The return value (like a pointer in this use case) can be stored there.


> v6:
> - to be double sure, replace &id->dev with (T)(&id->dev).

The support for data type casts is another interesting extension for
this source code analysis approach.
Further adjustments might become possible at other places of the presented SmPL script
after specific clarifications of previously mentioned implementation details.

Regards,
Markus
