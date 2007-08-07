From: Jeff Garzik <jeff@garzik.org>
Date: Tue, 07 Aug 2007 21:57:50 +0000
Subject: Re: [PATCH 76] drivers/net/via-velocity.c: mostly kmalloc + memset
Message-Id: <46B8EADE.3030705@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl> <200708010011.50979.m.kozlowski@tuxland.pl>
In-Reply-To: <200708010011.50979.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, romieu@fr.zoreil.com, netdev@vger.kernel.org

Mariusz Kozlowski wrote:
> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/net/via-velocity.c | 88263 -> 88120 (-143 bytes)
>  drivers/net/via-velocity.o | 254264 -> 253828 (-436 bytes)
> 
>  drivers/net/via-velocity.c |   24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

applied


