From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Sun, 19 Aug 2007 22:33:21 +0000
Subject: Re: convert #include "linux/..." to #include <linux/...> [PATCH]s
Message-Id: <Pine.LNX.4.64.0708200031560.19577@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561864.4200.136.camel@localhost>
In-Reply-To: <1187561864.4200.136.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@shadowen.org>


On Aug 19 2007 15:17, Joe Perches wrote:
>There are several files that:
>
>#include "linux/file" not #include <linux/file>
>#include "asm/file" not #include <asm/file>

Not only that. All directories in include should be checked against
(e.g. <net/*>)


	Jan
-- 
