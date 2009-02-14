From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:57:24 +0000
Subject: Re: [PATCH 08/43] drivers/net/ppp*.c: fix sparse warnings: fix
Message-Id: <154e089b0902141357x3af8b2adk223749ce11e976ef@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	 <20090214211346.23489.96321.stgit@vmbox.hanneseder.net>
	 <20090214212948.GE7648@localhost> <20090214213848.GF7648@localhost>
In-Reply-To: <20090214213848.GF7648@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrill Gorcunov <gorcunov@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 14, 2009 at 10:38 PM, Cyrill Gorcunov <gorcunov@gmail.com> wrote:
> [Cyrill Gorcunov - Sun, Feb 15, 2009 at 12:29:48AM +0300]
> | [Hannes Eder - Sat, Feb 14, 2009 at 10:13:52PM +0100]
> | | Fix this sparse warnings:
> | |   drivers/net/ppp_generic.c:919:43: warning: incorrect type in argument 1 (different signedness)
> | |   drivers/net/pppoe.c:1195:43: warning: incorrect type in argument 1 (different signedness)
> | |   drivers/net/pppol2tp.c:2666:43: warning: incorrect type in argument 1 (different signedness)
> | |
> | | Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> | ...
> |
> | Thanks Hannes,
> |
> | Acked-by: Cyrill Gorcunov <gorcunov@openvz.org>
> |
> |       - Cyrill -
>
> Btw I think the same fix could be applied on
> drivers/net/tun.c (if you have time for :)

This was fixed by this commit:
commit 745417e20684e4951afcabfe74583a3884e54980
Author: Gerrit Renker <gerrit@erg.abdn.ac.uk>
Date:   Sun Jan 4 17:14:46 2009 -0800

which is in the linux-next tree.

BTW, how can I check from which tree this commit came into the linux-next tree?

-Hannes
