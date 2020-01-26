From: James Bottomley <jejb@linux.ibm.com>
Date: Sun, 26 Jan 2020 16:18:24 +0000
Subject: Re: [PATCH] scsi: mvsas: ensure loop counter phy_no  does not wrap and cause an infinite loop
Message-Id: <1580055504.4964.2.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126151747.33320-1-colin.king@canonical.com>
In-Reply-To: <20200126151747.33320-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2020-01-26 at 15:17 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The loop counter phy_no is a u8 where as the upper limit of the loop
> is a u32. In the event that upper limit is greater than 255 we end
> up with an infinite loop since phy_no will wrap around an never reach
> upper loop limit. Fix this by making phy_no a u32.

This value is limited to MVS_MAX_PHYS (i.e. 8) so I don't see where the
concern comes from.  If we were ever to overrun that, we'd corrupt the
chip info structure, because it only allows MVS_MAX_PHYS for the amount
of space.

James
