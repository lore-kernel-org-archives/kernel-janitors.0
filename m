From: Zach Brown <zach.brown@oracle.com>
Date: Thu, 14 Feb 2008 17:25:40 +0000
Subject: Re: [PATCH 2/6] fs/direct-io.c: Use DIV_ROUND_UP
Message-Id: <47B47994.7020804@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0802141614050.1185@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0802141614050.1185@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
> (d)) but is perhaps more readable.

It certainly looks better to me, thanks for doing this.

> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-By: Zach Brown <zach.brown@oracle.com>

- z
