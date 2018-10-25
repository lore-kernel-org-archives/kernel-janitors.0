From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Oct 2018 07:08:16 +0000
Subject: Re: [PATCH] x86/ioremap: tighten integer overflow checking
Message-Id: <20181025070816.3e77nr25mskrkzqg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025061633.t32bxslxj3h7jv2x@kili.mountain>
 <eaaddd4a-5ed0-9b58-f4be-994ec38ed660@suse.com>
In-Reply-To: <eaaddd4a-5ed0-9b58-f4be-994ec38ed660@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Thu, Oct 25, 2018 at 08:28:44AM +0200, Juergen Gross wrote:
> On 25/10/2018 08:16, Dan Carpenter wrote:
> > The current check is a bit off in the case where "phys_addr + size"
> > wraps to zero because then "last_addr" is set to ULONG_MAX which is >> > phys_addr.
> 
> And -2 would be okay?
> 

If you see any patches from me it's static checker stuff...

I guess the original is actually fine because the -1 re-wraps back to
what we wanted it to be.  We also do verify that size is correct in
__ioremap_check_mem() so I can't see a problem here after all.

regards,
dan carpenter
