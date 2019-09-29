From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 29 Sep 2019 13:12:47 +0000
Subject: Re: [Cocci] [RFC PATCH] scripts: Fix coccicheck failed
Message-Id: <7664d59f-78cf-7644-0ee8-304b3d78d752@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190928094245.45696-1-yuehaibing@huawei.com>
In-Reply-To: <20190928094245.45696-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Yue Haibing <yuehaibing@huawei.com>
Cc: Martijn Coenen <maco@android.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>  rename scripts/{coccinelle/misc => }/add_namespace.cocci (100%)

I hope that such a SmPL script can be also independently used from
the other known call interface.

I suggest to think a bit more about the desired directory hierarchy.
If you would like to keep these files generally within a (sub)folder
of “scripts/coccinelle”, other solutions should be taken into account.
How do you think about to adjust the filter command?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=02dc96ef6c25f990452c114c59d75c368a1f4c8f#n257

* Which criteria should be finally chosen for automatic script execution?

* Would you like to reconsider any more consequences around collateral evolution?

Regards,
Markus
