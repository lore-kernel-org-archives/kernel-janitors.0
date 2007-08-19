From: Al Viro <viro@ftp.linux.org.uk>
Date: Sun, 19 Aug 2007 22:44:25 +0000
Subject: Re: convert #include "linux/..." to #include <linux/...> [PATCH]s follow
Message-Id: <20070819224425.GU21089@ftp.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561864.4200.136.camel@localhost> <Pine.LNX.4.64.0708200031560.19577@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0708200031560.19577@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@shadowen.org>

On Mon, Aug 20, 2007 at 12:33:21AM +0200, Jan Engelhardt wrote:
> 
> On Aug 19 2007 15:17, Joe Perches wrote:
> >There are several files that:
> >
> >#include "linux/file" not #include <linux/file>
> >#include "asm/file" not #include <asm/file>
> 
> Not only that. All directories in include should be checked against
> (e.g. <net/*>)

Except that some instances are legitimate (e.g. there was a bunch in
arch/um, IIRC)...
