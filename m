From: Joe Perches <joe@perches.com>
Date: Tue, 22 Dec 2009 10:59:11 +0000
Subject: Re: [PATCH] MAINTAINERS: Fix entry for uwb to include
Message-Id: <1261479551.1895.43.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261472760-24854-1-git-send-email-peterhuewe@gmx.de>
	 <1261473735.1895.22.camel@Joe-Laptop.home>
	 <200912221130.30586.PeterHuewe@gmx.de>
In-Reply-To: <200912221130.30586.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Peter =?ISO-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>
Cc: David Vrabel <david.vrabel@csr.com>, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Tue, 2009-12-22 at 11:30 +0100, Peter H=C3=BCwe wrote:
> Okay I guess it IS correct

Maybe it is.

David Vrabel should be able to ack/nack it.

By default, get_maintainer checks a 1 year history
for commits.  If a file hasn't had a modification
in over a year, it likely isn't maintained, it's
already perfect or it's obsolete.

You could change the get_maintainer history window
with --git-since=DAte

Anyway, if get_maintainer doesn't give you a result,
look at the git log for the file or look inside the
source code of the file itself.

Here's the _only_ commit for that file:

$ git log drivers/uwb/i1480/i1480-est.c
commit 1ba47da527121ff704f4e9f27a12c9f32db05022
Author: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>
Date:   Wed Sep 17 16:34:20 2008 +0100

    uwb: add the i1480 DFU driver
   =20
    Add the driver for downloading the firmware to an Intel i1480 device.
   =20
    Signed-off-by: David Vrabel <david.vrabel@csr.com>

And in the file:

 * Copyright (C) 2005-2006 Intel Corporation
 * Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>

So you should add Inaky to your patch cc list.

cheers, Joe

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
