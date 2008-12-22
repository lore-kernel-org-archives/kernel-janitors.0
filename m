From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Date: Mon, 22 Dec 2008 10:28:09 +0000
Subject: Re: [PATCH 1/11] drivers/ide: Move a dereference below a NULL test
Message-Id: <494F6BB9.5020406@ru.mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812161611280.20444@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812161611280.20444@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: bzolnier@gmail.com, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello.

Julia Lawall wrote:

> In each case, if the NULL test is necessary, then the dereference should be
> moved below the NULL test.
>
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @@
> type T;
> expression E;
> identifier i,fld;
> statement S;
> @@
>
> - T i = E->fld;
> + T i;
>   ... when != E
>       when != i
>   if (E = NULL) S
> + i = E->fld;
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>

MBR, Sergei


