From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Oct 2017 08:57:18 +0000
Subject: Re: [PATCH] ARM: mvebu: Use common error handling code in mvebu_armada_pm_init()
Message-Id: <20171023085718.lga7auriq7paw2hv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1c378b21-f10a-3a3a-fcee-8f0c0214a8fe@users.sourceforge.net>
In-Reply-To: <1c378b21-f10a-3a3a-fcee-8f0c0214a8fe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The error handling in mvebu_armada_pm_init() is incomplete and this
patch just smudges it around without fixing anything.

regards,
dan carpenter

