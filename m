From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 25 Jan 2021 16:37:03 +0000
Subject: Re: [PATCH] ACPICA: Common: Fix a typo
Message-Id: <CAJZ5v0hooTkVjXg-Emsr49aqV3PukEJYSJw03PEXxPYtSu+j0w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210124113252.733716-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210124113252.733716-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Robert Moore <robert.moore@intel.com>, Erik Kaneda <erik.kaneda@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jan 24, 2021 at 12:35 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> This module is 'cmfsize', not 'cfsize'.
> Fix it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I'm leaving this one to Bob and Erik, thanks!

> ---
>  tools/power/acpi/common/cmfsize.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/power/acpi/common/cmfsize.c b/tools/power/acpi/common/cmfsize.c
> index 9ea2c0aeb86c..185b8c588e1d 100644
> --- a/tools/power/acpi/common/cmfsize.c
> +++ b/tools/power/acpi/common/cmfsize.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
>  /******************************************************************************
>   *
> - * Module Name: cfsize - Common get file size function
> + * Module Name: cmfsize - Common get file size function
>   *
>   * Copyright (C) 2000 - 2021, Intel Corp.
>   *
> --
> 2.27.0
>
