From: Pierre Ossman <drzeus-mmc@drzeus.cx>
Date: Sun, 21 Dec 2008 16:19:55 +0000
Subject: Re: [PATCH 4/11] drivers/mmc: Move a dereference below a NULL test
Message-Id: <20081221171955.15c82df8@mjolnir.drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812161612440.20444@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812161612440.20444@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 16 Dec 2008 16:13:09 +0100 (CET)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
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
> 

Quite right. Queued up.

Rgds
-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  rdesktop, core developer          http://www.rdesktop.org

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.
