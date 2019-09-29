From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 29 Sep 2019 16:40:56 +0000
Subject: Re: [Cocci] [RFC PATCH] scripts: Fix coccicheck failed
Message-Id: <alpine.DEB.2.21.1909291840280.3346@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-78162315-1569775256=:3346"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190928094245.45696-1-yuehaibing@huawei.com>
 <7664d59f-78cf-7644-0ee8-304b3d78d752@web.de>
In-Reply-To: <7664d59f-78cf-7644-0ee8-304b3d78d752@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Yue Haibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Matthias Maennich <maennich@google.com>, LKML <linux-kernel@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-78162315-1569775256=:3346
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

> I suggest to think a bit more about the desired directory hierarchy.
> If you would like to keep these files generally within a (sub)folder
> of “scripts/coccinelle”, other solutions should be taken into account.
> How do you think about to adjust the filter command?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=02dc96ef6c25f990452c114c59d75c368a1f4c8f#n257

Changing this could also be a solution.

julia
--8323329-78162315-1569775256=:3346--
