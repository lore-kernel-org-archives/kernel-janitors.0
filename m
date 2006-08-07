From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 07 Aug 2006 23:06:11 +0000
Subject: Re: [KJ] [Patch] isa_read[bwl] in TODO
Message-Id: <20060807230611.GA6758@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1154985715.28109.2.camel@alice>
In-Reply-To: <1154985715.28109.2.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 07, 2006 at 11:21:55PM +0200, Eric Sesterhenn wrote:
> it seems that there are no more users of isa_read[bwl] and it isnt even
> defined anymore in most arches. The only define is in
> /include/asm-i386/io.h which is also the only user of this define
> ( maps readb() and readw() to isa_readb() and isa_readw() ).
> I guess its therefore safe to remove it from the janitor TODO list.

[clickety-click]

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
