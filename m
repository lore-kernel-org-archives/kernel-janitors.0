From: Borislav Petkov <bp@alien8.de>
Date: Thu, 20 Feb 2014 10:56:27 +0000
Subject: Re: [patch] EDAC: remove an unneeded condition in i5100_init_csrows()
Message-Id: <20140220105627.GD8876@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140213111738.GB15549@elgon.mountain>
In-Reply-To: <20140213111738.GB15549@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 13, 2014 at 02:17:38PM +0300, Dan Carpenter wrote:
> We checked that "npages" was not zero a couple lines earlier so we can
> remove this and pull the code in one indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
