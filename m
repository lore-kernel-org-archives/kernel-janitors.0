From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 13:40:17 +0000
Subject: Re: net/ncsi: prevent memory leak in ncsi_rsp_handler_gc
Message-Id: <2bee11b1-b6f9-8d5f-1e94-5ce9d2381d9a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190927031501.GF22969@cs-dulles.cs.umn.edu>
In-Reply-To: <20190927031501.GF22969@cs-dulles.cs.umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen A McCamant <smccaman@umn.edu>, Al Viro <viro@zeniv.linux.org.uk>, "David S. Miller" <davem@davemloft.net>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> > > In ncsi_rsp_handler_gc if allocation for nc->vlan_filter.vids fails the
> > > allocated memory for nc->mac_filter.addrs should be released.
…
> The problem is that just by traversing the code using tools
> like ctags or elixir I couldn't find any caller to ncsi_rsp_handler_gc
> that handles such errnos.

Would you like to collaborate with higher level source code analysis tools?


How do you think about to add the tag “Fixes” here?

Regards,
Markus
