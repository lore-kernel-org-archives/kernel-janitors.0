From: Joe Perches <joe@perches.com>
Date: Sun, 19 Aug 2007 23:05:23 +0000
Subject: Re: convert #include "linux/..." to #include <linux/...> [PATCH]s
Message-Id: <1187564724.4200.170.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561864.4200.136.camel@localhost>
	 <Pine.LNX.4.64.0708200031560.19577@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0708200031560.19577@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@shadowen.org>

On Mon, 2007-08-20 at 00:33 +0200, Jan Engelhardt wrote:
> Not only that. All directories in include should be checked against
> (e.g. <net/*>)

Should any file in include/ have a line like:

	#include "[path/]file"

Shouldn't these all be

	#include <path/file>

?

