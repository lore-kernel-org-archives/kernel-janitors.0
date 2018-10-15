From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Mon, 15 Oct 2018 04:01:01 +0000
Subject: Re: powerpc: signedness bug in update_flash_db()
Message-Id: <42YPqx5Pf3z9sCw@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20181001164458.GB29197@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Geoff Levand <geoff@infradead.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Mon, 2018-10-01 at 16:44:58 UTC, Dan Carpenter wrote:
> The "count < sizeof(struct os_area_db)" comparison is type promoted to
> size_t so negative values of "count" are treated as very high values and
> we accidentally return success instead of a negative error code.
> 
> This doesn't really change runtime much but it fixes a static checker
> warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Geoff Levand <geoff@infradead.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/014704e6f54189a203cc14c7c0bb41

cheers
