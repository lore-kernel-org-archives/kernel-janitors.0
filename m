From: Borislav Petkov <bp@alien8.de>
Date: Tue, 06 Nov 2018 11:06:33 +0000
Subject: Re: [PATCH v2] edac: qcom_edac: uninitialized variable in IRQ handler
Message-Id: <20181106110633.GE13712@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181018141522.rywdvjmlpk4ticiw@kili.mountain>
In-Reply-To: <20181018141522.rywdvjmlpk4ticiw@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Channagoud Kadabi <ckadabi@codeaurora.org>, Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 18, 2018 at 04:24:38PM +0200, Borislav Petkov wrote:
> On Thu, Oct 18, 2018 at 05:15:22PM +0300, Dan Carpenter wrote:
> > We forgot to initialize "irq_handled" to false.  But really it's
> > cleaner to just get rid of that variable and use "irq_rc" directly
> > instead.
> > 
> > Fixes: 27450653f1db ("drivers: edac: Add EDAC driver support for QCOM SoCs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Get rid of the "irq_handled" variable.
> > 
> >  drivers/edac/qcom_edac.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Borislav Petkov <bp@suse.de>

Applied, thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
