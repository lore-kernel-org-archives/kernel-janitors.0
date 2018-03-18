From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 18 Mar 2018 03:18:59 +0000
Subject: Re: [PATCH] kvm: x86: hyperv: delete dead code in kvm_hv_hypercall()
Message-Id: <20180318031859.si5ma7vijr32gpzv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180317114827.GA4035@mwanda>
In-Reply-To: <20180317114827.GA4035@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Mar 17, 2018 at 08:11:42AM -0700, Liran Alon wrote:
> 
> ----- dan.carpenter@oracle.com wrote:
> 
> > "rep_done" is always zero so the "(((u64)rep_done & 0xfff) << 32)"
> > expression is just zero.  We can remove the "res" temporary variable
> > as
> > well and just use "ret" directly.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> 
> I think this commit should better be dropped than applied.
> The original code makes sense.

It causes static checker warnings and kernel style says there shouldn't
be code without a user.  Plus we're not really deleting it, it's still
there in the git log.

regards,
dan carpenter

