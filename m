From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Date: Tue, 22 Dec 2009 10:30:30 +0000
Subject: Re: [PATCH] MAINTAINERS: Fix entry for uwb to include subdirectories
Message-Id: <200912221130.30586.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261472760-24854-1-git-send-email-peterhuewe@gmx.de> <1261473735.1895.22.camel@Joe-Laptop.home>
In-Reply-To: <1261473735.1895.22.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: David Vrabel <david.vrabel@csr.com>, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

Am Dienstag 22 Dezember 2009 10:22:15 schrieb Joe Perches:
> On Tue, 2009-12-22 at 10:05 +0100, Peter Huewe wrote:
> > This little patch removes the asterisk wildcard, in order to get the uwb
> > maintainer when using get_maintainer.pl on anyfiles in the
> > subdirectories of uwb.
> 
> Is this correct?
> Does David Vrabel maintain drivers/uwb/i1480/ ?
> 
> drivers/uwb/wlp/ is separately maintained
> WIMEDIA LLC PROTOCOL (WLP) SUBSYSTEM

Okay I guess it IS correct - if you look at the entries in MAINTAINERS:
both 
drivers/uwb/wlp/  and drivers/uwb/
are infact maintained by David - only the mailing list is missing from the 
second.

ULTRA-WIDEBAND (UWB) SUBSYSTEM:
M:  David Vrabel <david.vrabel@csr.com>
L:  linux-usb@vger.kernel.org
S:  Supported
F:  drivers/uwb/*
F:  include/linux/uwb.h
F:  include/linux/uwb/


WIMEDIA LLC PROTOCOL (WLP) SUBSYSTEM
M:  David Vrabel <david.vrabel@csr.com>
S:  Maintained
F:  include/linux/wlp.h
F:  drivers/uwb/wlp/


