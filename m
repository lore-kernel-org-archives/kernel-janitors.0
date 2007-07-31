From: Andrew Vasquez <andrew.vasquez@qlogic.com>
Date: Tue, 31 Jul 2007 22:00:07 +0000
Subject: Re: [PATCH 64] drivers/scsi/qla2xxx/qla_init.c: mostly kmalloc + memset conversion to k[cz]alloc
Message-Id: <20070731220007.GI8842@plap.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl> <200707312351.10536.m.kozlowski@tuxland.pl>
In-Reply-To: <200707312351.10536.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-driver@qlogic.com, linux-scsi@vger.kernel.org

On Tue, 31 Jul 2007, Mariusz Kozlowski wrote:

> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/scsi/qla2xxx/qla_init.c | 107445 -> 107327 (-118 bytes)
>  drivers/scsi/qla2xxx/qla_init.o | 237540 -> 237424 (-116 bytes)
> 
>  drivers/scsi/qla2xxx/qla_init.c |   14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Acked-by: Andrew Vasquez <andrew.vasquez@qlogic.com>
