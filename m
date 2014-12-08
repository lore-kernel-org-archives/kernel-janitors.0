From: Joe Perches <joe@perches.com>
Date: Mon, 08 Dec 2014 03:55:12 +0000
Subject: Re: [PATCH 0/20] fix misspelling of current function in string
Message-Id: <1418010912.31745.29.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, linux@rasmusvillemoes.dk, linux-arm-kernel@lists.infradead.org

On Sun, 2014-12-07 at 20:20 +0100, Julia Lawall wrote:
> These patches replace what appears to be a reference to the name of the
> current function but is misspelled in some way by either the name of the
> function itself, or by %s and then __func__ in an argument list.

At least a few of these seem to be function tracing
style uses that might as well be deleted instead.

