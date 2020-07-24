From: "Moore, Robert" <robert.moore@intel.com>
Date: Fri, 24 Jul 2020 16:50:55 +0000
Subject: RE: [PATCH] trivial: acpi: replace some bitshifts with BIT macro
Message-Id: <BYAPR11MB32563CE55D8019DA86861A7387770@BYAPR11MB3256.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2007241814450.2834@hadrien>
        <20200724162050.18077-2-garritfranke@gmail.com>
        <BYAPR11MB325604ACC5F3BCCEB89A58AA87770@BYAPR11MB3256.namprd11.prod.outlook.com>
 <20200724184738.ce10d8db0bbe138e2b24f7a6@gmail.com>
In-Reply-To: <20200724184738.ce10d8db0bbe138e2b24f7a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Garrit Franke <garritfranke@gmail.com>
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "trivial@kernel.org" <trivial@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "devel@acpica.org" <devel@acpica.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Well, since BIT is a linux macro only, we can't use it in ACPICA, because the code is compiler/environment independent.
Bob


-----Original Message-----
From: Garrit Franke <garritfranke@gmail.com> 
Sent: Friday, July 24, 2020 9:48 AM
To: Moore, Robert <robert.moore@intel.com>
Cc: Wysocki, Rafael J <rafael.j.wysocki@intel.com>; lenb@kernel.org; trivial@kernel.org; linux-acpi@vger.kernel.org; devel@acpica.org; kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] trivial: acpi: replace some bitshifts with BIT macro

On Fri, 24 Jul 2020 16:29:14 +0000
"Moore, Robert" <robert.moore@intel.com> wrote:

> Where is "BIT" defined?

It is defined in multiple places (see include/vdso/bits.h for example), therefore I blatently assumed that it would be defined. I'm quite new to kernel development, and I'm learning along the way. Thank you for pointing this out.

Would it make sense to copy this file to this drivers root, or is it not worth the effort?

Thanks for your time
Garrit
