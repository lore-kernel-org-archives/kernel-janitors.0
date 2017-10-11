From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Wed, 11 Oct 2017 10:17:19 +0000
Subject: Re: [PATCH] usb: typec: wcove: fix uninitialized usbc_irq1 and usbc_irq2
Message-Id: <20171011101719.GC24789@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171011090957.16499-1-colin.king@canonical.com>
In-Reply-To: <20171011090957.16499-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 11, 2017 at 10:09:57AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Calls to regmap_read may fail with an -EINVAL return without setting
> usbc_irq1 and usbc_irq2.  The error handling clean up expects these
> to have been set (or zero on a failure) and currently may try to
> clear the wrong IRQs if the uninitalized garbage values in usbc_irq1
> or usbc_irq2 are non-zero.  The simplest fix is to ensure these
> variables are initialized to zero.
> 
> Detected by CoverityScan, CID#1457737 ("Uninitialized scalar variable")
> 
> Fixes: 3c4fb9f16921 ("usb: typec: wcove: start using tcpm for USB PD support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


Thanks,

-- 
heikki
