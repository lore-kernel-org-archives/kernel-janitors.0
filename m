From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 19 Feb 2004 17:35:27 +0000
Subject: [Kernel-janitors] Re: reference_init.pl for Linux 2.6
Message-Id: <20040219093527.77b7b053.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040218182313.7b7b915e.rddunlap@osdl.org>
	<2263.1077192048@ocs3.ocs.com.au>
In-Reply-To: <2263.1077192048@ocs3.ocs.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Owens <kaos@ocs.com.au>
Cc: kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

On Thu, 19 Feb 2004 23:00:48 +1100 Keith Owens <kaos@ocs.com.au> wrote:

| On Wed, 18 Feb 2004 18:23:13 -0800, 
| "Randy.Dunlap" <rddunlap@osdl.org> wrote:
| >I have updated Keith Owens "reference_init.pl" script for
| >Linux 2.6.  It searches for code that refers to other code
| >sections that they should not reference, such as init code
| >calling exit code or v.v.
| >script for Linux 2.6 is at:
| >http://developer.osdl.org/rddunlap/scripts/reference_init26.pl
| 
| You added '$from !~ /\.data/'.  Any references from the .data section
| to .init or .exit text should be checked.  It is usually a struct
| containing a pointer to code that will be discarded, and is dangerous.
| 
| There is also a spurious comment line,
| #                   $from !~ $line && $line !~ $from &&
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Both fixed and reposted.
The output probably has a bit more false positives reported now.

script:
http://developer.osdl.org/rddunlap/scripts/reference_init26.pl

output on linux-2.6.3 with CONFIG_HOTPLUG=n and very few modules:
http://developer.osdl.org/rddunlap/scripts/badrefs.out


Thanks, Keith.
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
