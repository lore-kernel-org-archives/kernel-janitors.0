From: Keith Owens <kaos@ocs.com.au>
Date: Thu, 19 Feb 2004 12:00:48 +0000
Subject: [Kernel-janitors] Re: reference_init.pl for Linux 2.6
Message-Id: <2263.1077192048@ocs3.ocs.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: Your message of "Wed, 18 Feb 2004 18:23:13 -0800."
             <20040218182313.7b7b915e.rddunlap@osdl.org> 
References: <20040219025138.GA1838@redhat.com>
In-Reply-To: <20040219025138.GA1838@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Randy.Dunlap" <rddunlap@osdl.org>
Cc: kjo <kernel-janitors@osdl.org>, lkml <linux-kernel@vger.kernel.org>

On Wed, 18 Feb 2004 18:23:13 -0800, 
"Randy.Dunlap" <rddunlap@osdl.org> wrote:
>I have updated Keith Owens "reference_init.pl" script for
>Linux 2.6.  It searches for code that refers to other code
>sections that they should not reference, such as init code
>calling exit code or v.v.
>script for Linux 2.6 is at:
>http://developer.osdl.org/rddunlap/scripts/reference_init26.pl

You added '$from !~ /\.data/'.  Any references from the .data section
to .init or .exit text should be checked.  It is usually a struct
containing a pointer to code that will be discarded, and is dangerous.

There is also a spurious comment line,
#                   $from !~ $line && $line !~ $from &&

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
