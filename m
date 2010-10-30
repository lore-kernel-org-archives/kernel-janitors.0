From: Alexander Graf <agraf@suse.de>
Date: Sat, 30 Oct 2010 19:16:57 +0000
Subject: Re: [PATCH v2] powerpc: kvm: powerpc: fix information leak to userland
Message-Id: <1480CDBF-0A4A-49EC-AF4C-CED1D63BB911@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288464922-8812-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288464922-8812-1-git-send-email-segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Avi Kivity <avi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Marcelo Tosatti <mtosatti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


On 30.10.2010, at 11:55, Vasiliy Kulikov wrote:

> Structure kvm_ppc_pvinfo is copied to userland with "flags" and "pad"
> fields unitialized.  It leads to leaking of contents of kernel stack
> memory.  We have to initialize them to zero.
> 
> In patch v1 Jan Kiszka suggested to fill reserved fields with zeros
> instead of memset'ting the whole struct.  It makes sense as these
> fields are explicitly marked as padding.  No more fields need zeroing.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
> arch/powerpc/kvm/powerpc.c |    2 ++
> 1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2f87a16..5962336 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -604,6 +604,8 @@ static int kvm_vm_ioctl_get_pvinfo(struct kvm_ppc_pvinfo *pvinfo)
> 	pvinfo->hcall[1] = inst_ori | (KVM_SC_MAGIC_R0 & inst_imm_mask);
> 	pvinfo->hcall[2] = inst_sc;
> 	pvinfo->hcall[3] = inst_nop;
> +	pvinfo->flags = 0;
> +	memset(&pvinfo->pad, 0, sizeof(pvinfo->pad));

This should only be memset(pvinfo->pad), no? It's an array after all which automatically translates to a pointer when referenced.

Alex

