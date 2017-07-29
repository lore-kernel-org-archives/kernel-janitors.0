From: David Miller <davem@davemloft.net>
Date: Sat, 29 Jul 2017 01:53:14 +0000
Subject: Re: [PATCH 0/2] constify inet6_protocol structures
Message-Id: <20170728.185314.2227455199330921123.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501273138-22771-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501273138-22771-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, bhumirks@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 22:18:56 +0200

> The inet6_protocol structure is only passed as the first argument to
> inet6_add_protocol or inet6_del_protocol, both of which are declared as
> const.  Thus the inet6_protocol structure itself can be const.
> 
> Done with the help of Coccinelle.
 ...

Series applied, thanks Julia.
