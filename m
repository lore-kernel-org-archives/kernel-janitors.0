From: David Vrabel <david.vrabel@citrix.com>
Date: Fri, 26 Aug 2016 09:48:15 +0000
Subject: Re: [Xen-devel] [PATCH] xen/grant-table: Use kmalloc_array() in arch_gnttab_valloc()
Message-Id: <57C0105F.1010201@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a04e3d1-2756-9e3a-e5ba-f5d0e6495df7@users.sourceforge.net>
In-Reply-To: <8a04e3d1-2756-9e3a-e5ba-f5d0e6495df7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, xen-devel@lists.xenproject.org, x86@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>

On 25/08/16 12:30, SF Markus Elfring wrote:
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

Applied to for-linus-4.9, thanks.

David
