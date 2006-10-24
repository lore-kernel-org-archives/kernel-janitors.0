From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 24 Oct 2006 08:26:15 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/pci/
Message-Id: <20061024082615.GA5344@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2006 at 10:22:57PM +0200, Eric Sesterhenn wrote:
> replace open coded kmemdup() to save some screen space,
> and allow inlining/not inlining to be triggered by gcc.

Patches are OK, btw what inlining/non inlining you are referring too?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
