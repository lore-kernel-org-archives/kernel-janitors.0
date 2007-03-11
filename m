From: Andrew Morton <akpm@linux-foundation.org>
Date: Sun, 11 Mar 2007 10:04:49 +0000
Subject: Re: [KJ] [PATCH 2.6.21-rc3] i386: Fix GDT's number of quadwords in
Message-Id: <20070311020449.fd48bae2.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070307231819.GC1949@Ahmed>
In-Reply-To: <20070307231819.GC1949@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> On Wed, 7 Mar 2007 16:07:49 -0800 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
> Hi list,
> 
> Fix comments to represent the true number of quadwords in GDT.
> 
> Signed-off-by: Ahmed S. Darwish <darwish.07@gmail.com>
> ---

This should have been

From: Ahmed

	<changelog>

Signed-off-by: Ahmed
Signed-off-by: Randy

> cc: to Andrew for merging.  Is this method OK with you for KJ patches
> or would you prefer to see a KJ patchset maintained (again)?

I'm easy.  But please be aware that I prefer not to do spello and grammaro
fixes, unless they're in something user-visible: a printk or documentation.
Simply because there would be no end to it.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
