From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 10 May 2020 09:07:18 +0000
Subject: Re: net/sonic: Fix some resource leaks in error handling paths
Message-Id: <bc70e24c-dd31-75b7-6ece-2ad31982641e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b7651b26-ac1e-6281-efb2-7eff0018b158@web.de>
 <alpine.LNX.2.22.394.2005100922240.11@nippy.intranet>
 <9d279f21-6172-5318-4e29-061277e82157@web.de>
 <alpine.LNX.2.22.394.2005101738510.11@nippy.intranet>
In-Reply-To: <alpine.LNX.2.22.394.2005101738510.11@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Finn Thain <fthain@telegraphics.com.au>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>

>> https://lore.kernel.org/lkml/20200427061803.53857-1-christophe.jaillet@wanadoo.fr/
>
> Do you know when these bugs were introduced?

I suggest to take another look at a provided tag “Fixes”.
To which commit would you like to refer to for the proposed adjustment of
the function “mac_sonic_platform_probe”?


> Naming goto labels is just painting another bikeshed. Yes, some
> alternatives are preferable but it takes too long to identify them and
> finding consensus is unlikely anyway, as it's a matter of taste.

Would you find numbered labels unwanted according to a possible interpretation
related to “GW-BASIC” identifier selection?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=e99332e7b4cda6e60f5b5916cf9943a79dbef902#n460

Can programming preferences evolve into the direction of “say what the goto does”?

Regards,
Markus
