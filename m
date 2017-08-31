From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Thu, 31 Aug 2017 11:36:21 +0000
Subject: Re: powerpc/44x: mask and shift to zero bug
Message-Id: <3xjgLY3B4Qz9t2y@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170825103340.op3uphrv3eyeutiz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Matthias Fuchs <matthias.fuchs@esd-electronics.com>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Fri, 2017-08-25 at 10:33:40 UTC, Dan Carpenter wrote:
> My static checker complains that 0x00001800 >> 13 is zero.  Looking at
> the context, it seems like a copy and paste bug from the line below and
> probably 0x3 << 13 or 0x00006000 was intended.
> 
> Fixes: 2af59f7d5c3e ("[POWERPC] 4xx: Add 405GPr and 405EP support in boot wrapper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8d046759f6ad75824fdf7b9c9a3da0

cheers
