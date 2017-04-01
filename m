From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sat, 01 Apr 2017 22:11:17 +0000
Subject: Re: [PATCH] NFC: nfcmrvl: double free on error path
Message-Id: <20170401221117.GD22034@zurbaran.ger.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170308052237.GA14542@mwanda>
In-Reply-To: <20170308052237.GA14542@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vincent Cuissard <cuissard@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Mar 08, 2017 at 08:22:37AM +0300, Dan Carpenter wrote:
> The nci_spi_send() function calls kfree_skb(skb) on both error and
> success so this extra kfree_skb() is a double free.
> 
> Fixes: caf6e49bf6d0 ("NFC: nfcmrvl: add spi driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  Not tested.
Applied to nfc-next, thanks.

Cheers,
Samuel.
