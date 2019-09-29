From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 29 Sep 2019 18:00:27 +0000
Subject: Re: [Cocci] [RFC PATCH] scripts: Fix coccicheck failed
Message-Id: <90cea5d2-b586-6f82-34dd-d7a812f57396@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1909291810300.3346@hadrien>
In-Reply-To: <alpine.DEB.2.21.1909291810300.3346@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: cocci@systeme.lip6.fr, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Yue Haibing <yuehaibing@huawei.com>
Cc: Martijn Coenen <maco@android.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Maybe the problem would be solved by putting virtual report at the top of the rule.

I assume that support for the operation mode “patch” can eventually be considered.


> But it might still fail because nothing can happen without a value
> for the virtual metavariable ns.

I imagine that the safe handling of this command line input parameter
will trigger further software development concerns.


> Should the coccinelle directory be only for things that work with make coccicheck,

I hope not.

But it seems that a filter command expressed such a restriction so far.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=02dc96ef6c25f990452c114c59d75c368a1f4c8f#n257

Is this place an update candidate now?


> or for all Coccinelle scripts?

I would prefer file storage selections in this direction.
How do you think about to improve the software taxonomy accordingly?

Regards,
Markus
