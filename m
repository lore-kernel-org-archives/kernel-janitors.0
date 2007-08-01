From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Wed, 01 Aug 2007 21:02:34 +0000
Subject: Re: [PATCH 31] drivers/scsi/ide-scsi.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708012302.34205.bzolnier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl> <200707312001.58138.m.kozlowski@tuxland.pl>
In-Reply-To: <200707312001.58138.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-scsi@vger.kernel.org

On Tuesday 31 July 2007, Mariusz Kozlowski wrote:
> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/scsi/ide-scsi.c | 34642 -> 34536 (-106 bytes)
>  drivers/scsi/ide-scsi.o | 171728 -> 171524 (-204 bytes)
> 
>  drivers/scsi/ide-scsi.c |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

applied
