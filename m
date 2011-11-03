From: Alan Cox <alan@linux.intel.com>
Date: Thu, 03 Nov 2011 15:36:09 +0000
Subject: Re: [patch] Staging: sep: potential buffer overflow in ioctl
Message-Id: <20111103153609.46896295@bob.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 29 Oct 2011 10:20:20 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> tail_size is determined by several variables that come from the user
> so we should verify that it's not too large.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alan Cox <alan@linux.intel.com>
