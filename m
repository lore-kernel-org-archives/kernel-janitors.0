From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 13:15:06 +0000
Subject: Re: genetlink: prevent memory leak in netlbl_unlabel_defconf
Message-Id: <c490685a-c7d6-5c95-5bf4-ed71f3c60cb6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHC9VhR+4pZObDz7kG+rxnox2ph4z_wpZdyOL=WmdnRvdQNH9A@mail.gmail.com>
In-Reply-To: <CAHC9VhR+4pZObDz7kG+rxnox2ph4z_wpZdyOL=WmdnRvdQNH9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Paul Moore <paul@paul-moore.com>, Navid Emamdoost <navid.emamdoost@gmail.com>, linux-security-module@vger.kernel.org, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Stephen A McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>

> > In netlbl_unlabel_defconf if netlbl_domhsh_add_default fails the
> > allocated entry should be released.
…
> That said, netlbl_unlabel_defconf() *should* clean up here just on
> principal if nothing else.

How do you think about to add the tag “Fixes” then?

Regards,
Markus
