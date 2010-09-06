From: Olof Johansson <olof@lixom.net>
Date: Mon, 06 Sep 2010 16:30:44 +0000
Subject: Re: [PATCH 4/8] drivers/i2c/busses/i2c-pasemi.c: Fix unsigned
Message-Id: <20100906163044.GA14188@lixom.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283713226-8429-1-git-send-email-julia@diku.dk> <1283713226-8429-5-git-send-email-julia@diku.dk>
In-Reply-To: <1283713226-8429-5-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>, "Jean Delvare (PC drivers, core)" <khali@linux-fr.org>, linuxppc-dev@lists.ozlabs.org

On Sun, Sep 05, 2010 at 09:00:22PM +0200, Julia Lawall wrote:
> The function has an unsigned return type, but returns a negative constant
> to indicate an error condition.  The result of calling the function is
> always stored in a variable of type (signed) int, and thus unsigned can be
> dropped from the return type.
> 
> A sematic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @exists@
> identifier f;
> constant C;
> @@
> 
>  unsigned f(...)
>  { <+...
> *  return -C;
>  ...+> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Olof Johansson <olof@lixom.net>

