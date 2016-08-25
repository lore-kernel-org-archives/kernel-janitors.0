From: Juergen Gross <jgross@suse.com>
Date: Thu, 25 Aug 2016 12:03:08 +0000
Subject: Re: [PATCH] xen/grant-table: Use kmalloc_array() in arch_gnttab_valloc()
Message-Id: <58ea7176-c48f-65e0-29f8-bd5518cee150@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a04e3d1-2756-9e3a-e5ba-f5d0e6495df7@users.sourceforge.net>
In-Reply-To: <8a04e3d1-2756-9e3a-e5ba-f5d0e6495df7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, xen-devel@lists.xenproject.org, x86@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On 25/08/16 13:30, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 25 Aug 2016 13:23:06 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus reuse the corresponding function "kmalloc_array".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data type by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
