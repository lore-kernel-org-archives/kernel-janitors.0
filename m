From: David Miller <davem@davemloft.net>
Date: Tue, 01 Aug 2017 17:04:17 +0000
Subject: Re: [PATCH 0/2] Revert "ipv6: constify inet6_protocol structures"
Message-Id: <20170801.100417.1363745993686752810.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501604849-19443-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501604849-19443-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, bhumirks@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue,  1 Aug 2017 18:27:27 +0200

> inet6_add_protocol and inet6_del_protocol include casts that remove the
> effect of the const annotation on their parameter, leading to possible
> runtime crashes.

Series applied, thanks for following up on this.
