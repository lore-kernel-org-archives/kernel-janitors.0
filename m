From: "Salyzyn, Mark" <mark_salyzyn@adaptec.com>
Date: Tue, 31 Jul 2007 17:45:23 +0000
Subject: RE: [PATCH 21] drivers/scsi/dpt_i2o.c: kmalloc + memset conversion to kzalloc
Message-Id: <AE4F746F2AECFC4DA4AADD66A1DFEF01CB7477@otce2k301.adaptec.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311935.13958.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311935.13958.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-scsi@vger.kernel.org

ACK

Looks good and ultra-light on side effects!

Sincerely -- Mark Salyzyn

> -----Original Message-----
> From: Mariusz Kozlowski [mailto:m.kozlowski@tuxland.pl] 
> Sent: Tuesday, July 31, 2007 1:35 PM
> To: linux-kernel@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; Andrew Morton; 
> linux-scsi@vger.kernel.org; AACRAID
> Subject: [PATCH 21] drivers/scsi/dpt_i2o.c: kmalloc + memset 
> conversion to kzalloc
> 
> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/scsi/dpt_i2o.c | 87632 -> 87457 (-175 bytes)
>  drivers/scsi/dpt_i2o.o | 213064 -> 212324 (-740 bytes)
> 
>  drivers/scsi/dpt_i2o.c |   27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
