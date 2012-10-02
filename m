From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 20:46:05 +0000
Subject: Re: [acpi:next 4/5] drivers/acpi/scan.c:328 acpi_device_remove_files() info: redundant null check on
Message-Id: <20121002204604.GW4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002073952.GA24180@localhost>
 <A961433CDFF2F640A2866803152E61F950D26B71@G4W3226.americas.hpqcorp.net>
In-Reply-To: <A961433CDFF2F640A2866803152E61F950D26B71@G4W3226.americas.hpqcorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ortiz, Lance E" <lance.oritz@hp.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Len Brown <len.brown@intel.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

On Tue, Oct 02, 2012 at 06:53:05PM +0000, Ortiz, Lance E wrote:
> Thanks for letting me know. I send out an updated patch removing
> the redundant check.  But I am wondering if we should leave it in
> for safety's sake.

There is no safety issue here.  kfree() will always accept NULL
pointers.  It's cleaner to leave it out.

> Is having a info message like this from smatch a problem?

It's not a problem.  We just send you the one email is all.

regards,
dan carpenter

