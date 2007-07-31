From: Francois Romieu <romieu@fr.zoreil.com>
Date: Tue, 31 Jul 2007 22:32:47 +0000
Subject: Re: [PATCH 76] drivers/net/via-velocity.c: mostly kmalloc + memset conversion to kcalloc
Message-Id: <20070731223247.GA22528@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl> <200708010011.50979.m.kozlowski@tuxland.pl>
In-Reply-To: <200708010011.50979.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org

Mariusz Kozlowski <m.kozlowski@tuxland.pl> :
> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/net/via-velocity.c | 88263 -> 88120 (-143 bytes)
>  drivers/net/via-velocity.o | 254264 -> 253828 (-436 bytes)
> 
>  drivers/net/via-velocity.c |   24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Acked-by: Francois Romieu <romieu@fr.zoreil.com>

-- 
Ueimor
