From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Feb 2019 07:42:58 +0000
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW3Y2XSBjb2NjaW5lbGxlOiBzZW1hbnRpYyBjb2Rl?= =?UTF-8?Q?_search_for_missing_p
Message-Id: <766c87f0-fef2-0997-b0a4-3d3d26711b79@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
 <52c3fdf6-0d04-eed5-da57-ef7d1008c291@web.de>
 <HK0PR02MB3634E4B3441651D4F7737399B2620@HK0PR02MB3634.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB3634E4B3441651D4F7737399B2620@HK0PR02MB3634.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <yellowriver2010@hotmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

> But please also refer to the examples of coccinelle, such as:
> http://coccinelle.lip6.fr/rules/kmalloc.html
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/free/pci_free_consistent.cocci

These scripts for the semantic patch language show some software design possibilities.
They contain implementation details which can be also worth for additional
development considerations.
Will systematic refactoring become more interesting?


> You will find that there are differences between coccinelle and c.

Would you like to discuss any of them further?

Regards,
Markus
