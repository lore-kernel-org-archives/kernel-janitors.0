From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 22 Aug 2011 10:24:02 +0000
Subject: Re: [PATCH] drivers/mfd/timberdale.c: clean up error handling code
Message-Id: <20110822102402.GM4607@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312966036-15896-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312966036-15896-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Wed, Aug 10, 2011 at 10:47:16AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> In the first three cases, ioremap has been called, so iounmap is needed.  A
> new label for this is introduced, to differentiate it from err_msix, which
> is the first point at which msix_entries actually needs to be freed.
Thanks a lot, patch applied.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
