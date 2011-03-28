From: David Miller <davem@davemloft.net>
Date: Mon, 28 Mar 2011 01:38:43 +0000
Subject: Re: [PATCH 1/3] tg3: use <linux/io.h> and <linux/uaccess.h>
Message-Id: <20110327.183843.116365744.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martinez.javier@gmail.com
Cc: mcarlson@broadcom.com, mchan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 27 Mar 2011 04:42:31 +0200

> It is proper style to include linux/foo.h instead asm/foo.h if both exist
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>

Applied.
