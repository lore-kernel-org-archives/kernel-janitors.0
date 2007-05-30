From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 30 May 2007 07:26:24 +0000
Subject: [KJ] Re: [PATCH] BLUETOOTH: Remove the redundant non-seekable llseek
Message-Id: <1180509984.21432.155.camel@aeonflux.holtmann.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Robert,

> Remove the llseek method given that the open method already calls
> nonseekable_open().
> 
> Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
> 
> ---
> 
> given that the fops open() method already calls nonseekable_open()
> at the end, it would seem that this old-style method for preventing
> lseeking is redundant.  am i reading that correctly?

I wasn't aware of that fact, but after reading through the VFS code I
agree that your patch is perfectly fine. Other drivers are using
no_llseek in some cases, but even that is not needed at all. So full ACK
from my side.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>

Regards

Marcel


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
