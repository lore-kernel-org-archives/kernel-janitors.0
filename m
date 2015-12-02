From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 02 Dec 2015 00:43:37 +0000
Subject: Re: MAINTAINERS: update a file name in drivers/acpi/
Message-Id: <20151201164337.32b67623f99a77abd59f81f1@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151201085840.GA26852@mwanda>
In-Reply-To: <20151201085840.GA26852@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 1 Dec 2015 10:24:31 +0100 (CET) Julia Lawall <julia.lawall@lip6.fr> wrote:

> > We renamed drivers/acpi/video.c to drivers/acpi/acpi_video.c in commit
> > 14ca7a47d0ab ('acpi-video-detect: video: Make video_detect code part of
> > the video module').
> 
> Actually, someone asked me recently who is the maintainer of MAINTAINERS,
> and it didn't seem obvious.  Is it Andrew?

Generally I'd expect the subsystem maintainer team to directly keep
their MAINTAINERS record up to date.  But yes, I'll take updates which
fall through the many cracks.

Joe Perches does the heavy lifting when MAINTAINERS maintenance and
development is concerned.

