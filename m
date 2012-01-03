From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Tue, 03 Jan 2012 18:42:26 +0000
Subject: Re: [PATCH 4/9] drivers/xen/gntalloc.c: introduce missing kfree
Message-Id: <20120103184226.GA27508@phenom.dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-4-git-send-email-julia@diku.dk>
In-Reply-To: <1324661974-17281-4-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Dec 23, 2011 at 06:39:29PM +0100, Julia Lawall wrote:
> Error handling code following a kmalloc should free the allocated data.
> Out_unlock is used on both success and failure, so free vm_priv before
> jumping to that label.

Applied. Thanks!
