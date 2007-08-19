From: Joe Perches <joe@perches.com>
Date: Sun, 19 Aug 2007 22:49:16 +0000
Subject: Re: convert #include "linux/..." to #include <linux/...> [PATCH]s
Message-Id: <1187563756.4200.167.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561864.4200.136.camel@localhost>
	 <Pine.LNX.4.64.0708200031560.19577@fbirervta.pbzchgretzou.qr>
	 <20070819224425.GU21089@ftp.linux.org.uk>
In-Reply-To: <20070819224425.GU21089@ftp.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ftp.linux.org.uk>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@shadowen.org>

On Sun, 2007-08-19 at 23:44 +0100, Al Viro wrote:
> Except that some instances are legitimate (e.g. there was a bunch in
> arch/um, IIRC)...

I guess it's a good thing that vger seems to have rejected
that 140KB patch I sent against arch/um and include/asm-um.

cheers, Joe

