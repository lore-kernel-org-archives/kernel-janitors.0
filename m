From: Samuel Ortiz <sameo@linux.intel.com>
Date: Tue, 20 Oct 2015 04:50:24 +0000
Subject: Re: [PATCH] NFC: nxp-nci: constify nxp_nci_phy_ops structure
Message-Id: <20151020045024.GD9764@zurbaran.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444562653-4914-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1444562653-4914-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Charles Gorand <charles.gorand@effinnov.com>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, linux-nfc@lists.01.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Sun, Oct 11, 2015 at 01:24:13PM +0200, Julia Lawall wrote:
> The only instance of a nxp_nci_phy_ops structure is never modified.  Thus
> the declaration of the structure and all references to the structure type
> can be made const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/nfc/nxp-nci/core.c    |    3 ++-
>  drivers/nfc/nxp-nci/i2c.c     |    2 +-
>  drivers/nfc/nxp-nci/nxp-nci.h |    5 +++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
Applied to nfc-next, thanks.

Cheers,
Samuel.
