From: Alexander Graf <agraf@suse.de>
Date: Tue, 02 Oct 2012 11:04:03 +0000
Subject: Re: [PATCH 3/6] arch/powerpc/kvm/e500_tlb.c: fix error return code
Message-Id: <BF4777C1-E76A-4AEB-A87D-FC2CBB465F98@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr> <1344160356-387-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>


On 05.08.2012, at 11:52, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Convert a 0 error return code to a negative one, as returned elsewhere in the
> function.
> 
> A new label is also added to avoid freeing things that are known to not yet
> be allocated.
> 
> A simplified version of the semantic match that finds the first problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier ret;
> expression e,e1,e2,e3,e4,x;
> @@
> 
> (
> if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
> |
> ret = 0
> )
> ... when != ret = e1
> *x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
> ... when != x = e2
>    when != ret = e3
> *if (x = NULL || ...)
> {
>  ... when != ret = e4
> *  return ret;
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Thanks, applied to kvm-ppc-next.


Alex

