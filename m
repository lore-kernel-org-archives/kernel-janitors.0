From: "Kaneda, Erik" <erik.kaneda@intel.com>
Date: Mon, 25 Jan 2021 19:37:31 +0000
Subject: RE: [Devel] Re: [PATCH] ACPICA: Common: Fix a typo
Message-Id: <MWHPR11MB15997833BCB69D4AC45AD245F0BD9@MWHPR11MB1599.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210124113252.733716-1-christophe.jaillet@wanadoo.fr>
 <CAJZ5v0hooTkVjXg-Emsr49aqV3PukEJYSJw03PEXxPYtSu+j0w@mail.gmail.com>
In-Reply-To: <CAJZ5v0hooTkVjXg-Emsr49aqV3PukEJYSJw03PEXxPYtSu+j0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: Rafael J. Wysocki <rafael@kernel.org>
> Sent: Monday, January 25, 2021 8:37 AM
> To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Kaneda, Erik <erik.kaneda@intel.com>; Wysocki, Rafael J
> <rafael.j.wysocki@intel.com>; ACPI Devel Maling List <linux-
> acpi@vger.kernel.org>; open list:ACPI COMPONENT ARCHITECTURE
> (ACPICA) <devel@acpica.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; kernel-janitors@vger.kernel.org
> Subject: [Devel] Re: [PATCH] ACPICA: Common: Fix a typo
> 
> On Sun, Jan 24, 2021 at 12:35 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > This module is 'cmfsize', not 'cfsize'.
> > Fix it.
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> I'm leaving this one to Bob and Erik, thanks!

Pull request available here: https://github.com/acpica/acpica/pull/661
Once this is merged, it will be included as a part of the next ACPICA release and as a part of Linuxized patch series.

Thanks,
Erik
> 
> > ---
> >  tools/power/acpi/common/cmfsize.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/power/acpi/common/cmfsize.c
> b/tools/power/acpi/common/cmfsize.c
> > index 9ea2c0aeb86c..185b8c588e1d 100644
> > --- a/tools/power/acpi/common/cmfsize.c
> > +++ b/tools/power/acpi/common/cmfsize.c
> > @@ -1,7 +1,7 @@
> >  // SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
> >
> /**********************************************************
> ********************
> >   *
> > - * Module Name: cfsize - Common get file size function
> > + * Module Name: cmfsize - Common get file size function
> >   *
> >   * Copyright (C) 2000 - 2021, Intel Corp.
> >   *
> > --
> > 2.27.0
> >
> _______________________________________________
> Devel mailing list -- devel@acpica.org
> To unsubscribe send an email to devel-leave@acpica.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
