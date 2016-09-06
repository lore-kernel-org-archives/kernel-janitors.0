From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Sep 2016 14:21:13 +0000
Subject: Re: ACPI-APEI-HEST: Fine-tuning for three function implementations
Message-Id: <0b722fa0-6bb3-812f-66ce-8db3b91ed107@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <9834b713-2c7b-ad6d-76a5-b1db40f561fc@users.sourceforge.net>
 <CAJZ5v0hcD8pi8y+jAtF70cJp8uYyUdOeDJKuR3z=JpB6Z_Qnfw@mail.gmail.com>
 <06ab72bc-6e00-1829-f1bf-67f0a31aff38@users.sourceforge.net>
 <CAJZ5v0i5EW1UpLfaogyD-s4P4vXdgWndwjOpF5ykPDXE=eZVSA@mail.gmail.com>
In-Reply-To: <CAJZ5v0i5EW1UpLfaogyD-s4P4vXdgWndwjOpF5ykPDXE=eZVSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

> Well, as I said elsewhere, if you make the same type of change in
> multiple places in one piece of code (or code maintained by the same maintainer),

I can imagine that my update suggestions will also trigger some additional
development efforts. I assume that some contributors appreciate
fine-grained patch series, don't they?


> you make it easier to review those changes if they go in one patch.

It might look convenient. But I find that there are more aspects to consider
for a better patch granularity.

Regards,
Markus
