From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 16:50:36 +0000
Subject: Re: mtd/ftl: Use kmalloc_array() in build_maps()
Message-Id: <e2e1d30e-b81f-d034-b266-37fec409350d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
 <b379ba57-d926-2572-17ec-5bbe166b0e37@users.sourceforge.net>
 <4be87294-5e91-5ced-770f-8630ccab689a@atmel.com>
In-Reply-To: <4be87294-5e91-5ced-770f-8630ccab689a@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> The indentation has been changed and the new one looks wrong...

The source code formatting contained various open issues before already.


> If you want to fix the indentation to make it compliant with the Linux
> coding style, do it on the whole file so every thing is uniform.

Such a development task is too much for me today.


> Reviewing such dummy/automatic patches is a pure waste of time,
> so personally I think we should just ignore them.

How much do you care for the usage of a function like “kmalloc_array”?

Regards,
Markus
