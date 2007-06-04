From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 04 Jun 2007 18:49:07 +0000
Subject: Re: [KJ] is it worth getting read of the "get_info" /proc interface?
Message-Id: <20070604184907.GA5719@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 31, 2007 at 03:01:17PM -0400, Robert P. J. Day wrote:
>   given that that interface has been discouraged for quite some time,
> and there's only a few instances of it left in the tree, is there any
> value in switching over those remaining instances

Yes.

> to a regular proc_read

No.

> and ditching (or at least officially deprecating) get_info?

Yes.

Trickiest part is code in core scsi. While switching use seq_file
interface, so we won't convert them again some time later.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
