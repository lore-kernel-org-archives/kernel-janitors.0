From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Date: Tue, 22 Dec 2009 10:23:18 +0000
Subject: Re: [PATCH] MAINTAINERS: Fix entry for uwb to include subdirectories
Message-Id: <200912221123.18969.PeterHuewe@gmx.de>
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
Okay I should have asked David first wether this is correct or not :) 
However I created a patch earlier today for 
uwb/i1480/i1480-est.c 
Subject was [PATCH 1/6] uwb/i1480: add __init/__exit macros
and was told by Marcel Holtmann:
>> @Jiri: As there is no maintainer, it seems it is up to you to decide :)
>actually David Vrabel is taking care of the UWB subsystem and everything
>related to it.

> 
> > Otherwise it get_maintainer.pl does not come up with a result
> 
> Sure it does:
> $ ./scripts/get_maintainer.pl -f drivers/uwb/i1480
> Jiri Kosina <jkosina@suse.cz>
> David Vrabel <david.vrabel@csr.com>
> Stephen Hemminger <shemminger@vyatta.com>
> David S. Miller <davem@davemloft.net>
> Nick Andrew <nick@nick-andrew.net>
> linux-kernel@vger.kernel.org

But it does not yield a result for any file within i1480:
$ ./scripts/get_maintainer.pl -f drivers/uwb/i1480/i1480-est.c
linux-kernel@vger.kernel.org
$

Regards,
Peter
