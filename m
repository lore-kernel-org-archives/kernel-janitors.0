From: Len Brown <lenb@kernel.org>
Date: Sun, 30 Nov 2008 05:11:36 +0000
Subject: Re: [PATCH] ACPI: EC: fix compilation warning
Message-Id: <alpine.LFD.2.00.0811300010570.3239@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49318541.0aec660a.0efb.3436@mx.google.com>
 <493199A4.5020203@suse.de>
In-Reply-To: <493199A4.5020203@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Starikovskiy <astarikovskiy@suse.de>
Cc: Hannes Eder <hannes@hanneseder.net>, Len Brown <len.brown@intel.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Sat, 29 Nov 2008, Alexey Starikovskiy wrote:

> Hannes Eder wrote:
> > Fix the warning introduced in commit
> > c5279dee26c0e8d7c4200993bfc4b540d2469598,
> > and give the dummy variable a more verbose name.
> Thanks!
> > 
> >   drivers/acpi/ec.c: In function 'acpi_ec_ecdt_probe':
> >   drivers/acpi/ec.c:1015: warning: ISO C90 forbids mixed declarations and
> > code
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Alexey Starikovskiy <astarikovskiy@suse.de>

applied on top of 11880 fix in acpi-test.

thanks,
-len

