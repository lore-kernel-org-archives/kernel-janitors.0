From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2015 13:13:58 +0000
Subject: Re: [patch] VFIO: platform: reset: fix a warning message condition
Message-Id: <20151217131358.GL5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151217122707.GA4267@mwanda>
 <5672AE80.3010806@linaro.org>
In-Reply-To: <5672AE80.3010806@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Auger <eric.auger@linaro.org>
Cc: Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

On Thu, Dec 17, 2015 at 01:45:52PM +0100, Eric Auger wrote:
> I add Thomas in CC since the bug also exists in the native driver I
> think (drivers/net/ethernet/amd/xgbe/drivers/net/ethernet/amd/xgbe
> /xgbe-dev.c, xgbe_exit function).
> 

Thanks, but I sent a patch for that one already.  (These are static
checker fixes).

regards,
dan carpenter

