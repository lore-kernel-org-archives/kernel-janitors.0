From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Aug 2013 22:33:39 +0000
Subject: Re: [PATCH] arch/arm/mach-pxa/stargate2.c: use ARRAY_AND_SIZE consistently
Message-Id: <20130810223338.GM5502@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376148353-9699-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376148353-9699-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

ARRAY_AND_SIZE() macro is horrible, and I would like it if it were
removed.  What I meant before was just that probably people will
probably complain if we try to remove it.

regards,
dan carpenter

