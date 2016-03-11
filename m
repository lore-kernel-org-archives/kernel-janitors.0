From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Mar 2016 09:19:19 +0000
Subject: Re: [patch] kexec: potetially using uninitialized variable
Message-Id: <20160311091919.GD5273@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311080747.GA31887@mwanda>
 <56E2875B.8010909@redhat.com>
In-Reply-To: <56E2875B.8010909@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xlpang@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@kernel.org>, Toshi Kani <toshi.kani@hpe.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>, Minfei Huang <mnfhuang@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 11, 2016 at 04:52:43PM +0800, Xunlei Pang wrote:
> Hi Dan,
> 
> On 2016/03/11 at 16:07, Dan Carpenter wrote:
> > At the end of the function we check if "ret" has a negative error code,
> > but it seems possible that it is uninitialized.
> >
> > Fixes: 12db5562e035 ('kexec: load and relocate purgatory at kernel load time')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> > index 503bc2d..63d1af3 100644
> > --- a/kernel/kexec_file.c
> > +++ b/kernel/kexec_file.c
> > @@ -795,7 +795,7 @@ out:
> >  
> >  static int kexec_apply_relocations(struct kimage *image)
> >  {
> > -	int i, ret;
> > +	int i, ret = 0;
> >  	struct purgatory_info *pi = &image->purgatory_info;
> >  	Elf_Shdr *sechdrs = pi->sechdrs;
> >  
> 
> Look further, there is a condition at the beginning of the for loop:
>  
> 
>         if (sechdrs[i].sh_type != SHT_RELA &&
>             sechdrs[i].sh_type != SHT_REL)
>             continue;
> 
> So, I think that's ok, but I don't konw if GCC is smart enough not to throw warnings.

Ah, right...

This wasn't a GCC warning.  GCC misses a lot of uninitialized variable
bugs so I'm doing this with Smatch.

Anyway, I'll patch this up in Smatch to not warn about this.

regards,
dan carpenter

