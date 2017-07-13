From: David Miller <davem@davemloft.net>
Date: Thu, 13 Jul 2017 16:24:32 +0000
Subject: Re: [PATCH] net: broadcom: bnx2x: make a couple of const arrays static
Message-Id: <20170713.092432.1028640160021503815.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711105223.14024-1-colin.king@canonical.com>
In-Reply-To: <20170711105223.14024-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Yuval.Mintz@cavium.com, ariel.elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Jul 2017 11:52:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate various tables on the stack but make them static const.
> Makes the object code smaller by nearly 200 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>  113468	  11200	      0	 124668	  1e6fc	bnx2x_ethtool.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>  113129	  11344	      0	 124473	  1e639	bnx2x_ethtool.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
