From: Jeff Garzik <jgarzik@pobox.com>
Date: Tue, 07 Aug 2007 21:57:43 +0000
Subject: Re: [PATCH 69] drivers/net/sb1250-mac.c: kmalloc + memset conversion
Message-Id: <46B8EAD7.2040105@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl> <200707312358.36567.m.kozlowski@tuxland.pl>
In-Reply-To: <200707312358.36567.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org

Mariusz Kozlowski wrote:
> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/net/sb1250-mac.c | 76286 -> 76199 (-87 bytes)
> 
>  drivers/net/sb1250-mac.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

applied


