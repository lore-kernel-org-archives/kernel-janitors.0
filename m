From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Sep 2016 03:28:01 +0000
Subject: Re: ACPI-video: Fine-tuning for several function implementations
Message-Id: <3e0cdc5b-fd15-515a-82f2-2f44792664ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <897ebf36-2fe5-e109-adf6-b81b6e863d9a@users.sourceforge.net>
 <CAJZ5v0hug9QfZHQosCFFXEcFMsDd=YvXkqMmQya3RSqmOnY4dg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hug9QfZHQosCFFXEcFMsDd=YvXkqMmQya3RSqmOnY4dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-acpi@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

> I'd prefer this to be combined into fewer patches
> that each will address several issues of one type,

I understand your concern a bit in principle.


> ie. put all label renames into one patch,

Are any of my update suggestions controversial here?


> all size determination improvements into another one and so on.

I am unsure about the acceptance for the selected software change opportunities.
So I chose a very specific patch granularity intentionally.

I tend to provide some change ideas for each affected function
implementation individually. I imagine that this way should support
the recombination of update steps to some degree already, shouldn't it?

Regards,
Markus
