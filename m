From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 29 Jun 2017 05:26:14 +0000
Subject: Re: [PATCH] powerpc: remapping too much memory
Message-Id: <87bmp7bc09.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170628114907.kf3t65mrdbq7rsfm@mwanda>
In-Reply-To: <20170628114907.kf3t65mrdbq7rsfm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Scott Wood <oss@buserror.net>
Cc: Kumar Gala <galak@kernel.crashing.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> There is a cut and paste error here so we use "sizeof(struct mpc83xx_pmc)"
> to remap the memory for "clock_regs".  That sizeof() is 20 bytes and we
> only need to remap 12 bytes.  It presumably doesn't affect run time too
> much...

I don't know 83xx well, but I suspect mappings occur on a 4K granularity
at a minimum :)

> I changed them to both use "sizeof(*variable_name)" because that's the
> prefered kernel style these days.

Thanks.

cheers
