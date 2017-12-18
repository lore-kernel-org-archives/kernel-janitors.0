From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Dec 2017 18:21:24 +0000
Subject: Re: [PATCH 0/6] PNP: Adjustments for four function implementations
Message-Id: <770be6e8-f97e-fd95-562c-3973f2faf542@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

> Date: Mon, 15 May 2017 21:03:21 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (6):
>   Delete an error message for a failed memory allocation in pnp_alloc()
>   Improve a size determination in pnp_alloc_dev()
>   Improve a size determination in pnp_clone_dependent_set()
>   Delete an error message for a failed memory allocation in pnp_clone_dependent_set()
>   Improve a size determination in quirk_awe32_add_ports()
>   Delete an error message for a failed memory allocation in quirk_awe32_add_ports()
> 
>  drivers/pnp/core.c   |  6 ++----
>  drivers/pnp/quirks.c | 15 ++++-----------
>  2 files changed, 6 insertions(+), 15 deletions(-)

How are the chances that such change possibilities will be integrated
in this software module?

Regards,
Markus
