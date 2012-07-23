From: "Luck, Tony" <tony.luck@intel.com>
Date: Mon, 23 Jul 2012 21:45:21 +0000
Subject: RE: [uapi:uapi-split 25/74] arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" pa
Message-Id: <3908561D78D1C84285E8C5FCA982C28F1936F6C0@ORSMSX104.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23199.1342949300@warthog.procyon.org.uk>
In-Reply-To: <23199.1342949300@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> My guess is that IA-64 paravirtualisation has been broken since:
>
>	commit 3c404b578fab699c4708279938078d9404b255a4
>	Author: Glauber Costa <glommer@redhat.com>
>	Date:   Mon Jul 11 15:28:15 2011 -0400

Probably longer than that ... the paravirt folks did a drive-by dump of
a lot of code & macros into ia64 ... and then disappeared leaving their
changes to bitrot :-(

-Tony
