From: Greg KH <greg@kroah.com>
Date: Sun, 27 Nov 2011 01:57:46 +0000
Subject: Re: [PATCH] drivers/staging/vt6656/wpa2.c: Change PRINT_K AND
Message-Id: <20111127015746.GD27297@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320870957-2583-1-git-send-email-marcos.mage@gmail.com>
In-Reply-To: <1320870957-2583-1-git-send-email-marcos.mage@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 09, 2011 at 06:35:57PM -0200, Marcos Paulo de Souza wrote:
> Removed PRINT_K and DBG_PRT as said in the TODO file, changing these for
> pr_debug.

Ick, most of these could be dev_dbg() and even then, a large chunk could
just be totally deleted, right?

Care to fix that up?

thanks,

greg k-h
