From: Borislav Petkov <bp@alien8.de>
Date: Fri, 30 Jan 2015 16:03:41 +0000
Subject: Re: [patch] mv64x60_edac: fix an error code in probe()
Message-Id: <20150130160341.GF1451@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150128191351.GC10259@mwanda>
In-Reply-To: <20150128191351.GC10259@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 28, 2015 at 10:13:51PM +0300, Dan Carpenter wrote:
> If edac_mc_add_mc() fails then we should preserve the error code, but
> instead the current code returns success.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
