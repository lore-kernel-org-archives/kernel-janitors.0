From: Rasesh Mody <rmody@brocade.com>
Date: Mon, 16 Apr 2012 22:45:17 +0000
Subject: RE: [PATCH] bna: 2:nd argument of function prototype should be an enum
Message-Id: <E5313AF6F2BFD14293E5FD0F94750F86B3A75C1811@HQ1-EXCH01.corp.brocade.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334613847-4341-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1334613847-4341-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>From: Emil Goode [mailto:emilgoode@gmail.com]
>Sent: Monday, April 16, 2012 3:04 PM
>
>The second argument of the function bfa_ioc_boot is an enum and
>its function prototype should have arguments of the same type.
>
>This patch fixes the following sparse error:
>drivers/net/ethernet/brocade/bna/bfa_ioc.c:1962:1: error:
>        symbol 'bfa_ioc_boot' redeclared with different type
>        (originally declared at
>drivers/net/ethernet/brocade/bna/bfa_ioc.c:83)
>        - incompatible argument 2 (different signedness)
>
>Signed-off-by: Emil Goode <emilgoode@gmail.com>

Thanks Emil!

Acked-by: Rasesh Mody <rmody@brocade.com>
