From: "Luck, Tony" <tony.luck@intel.com>
Date: Mon, 23 Jul 2012 21:55:54 +0000
Subject: RE: [uapi:uapi-split 25/74] arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" pa
Message-Id: <3908561D78D1C84285E8C5FCA982C28F1936F6F8@ORSMSX104.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23199.1342949300@warthog.procyon.org.uk>
In-Reply-To: <23199.1342949300@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Is it worth marking config PARAVIRT dependent on !IA64 so that
> allyes/modconfig builds work?

Sounds like a good idea to me. It will save people time discovering how broken this is.

-Tony
