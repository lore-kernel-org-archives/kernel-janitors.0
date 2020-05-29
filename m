From: Borislav Petkov <bp@alien8.de>
Date: Fri, 29 May 2020 09:47:58 +0000
Subject: Re: [PATCH] edac: Fix reference count leak in edac_device_register_sysfs_main_kobj()
Message-Id: <20200529094758.GD9011@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <28ebc99f-c0dd-00b2-7a53-9edf0df36c9c@web.de>
 <20200529093644.GC9011@zn.tnic>
 <c304a0b0-692a-0696-6750-05a3db6a4b42@web.de>
In-Reply-To: <c304a0b0-692a-0696-6750-05a3db6a4b42@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Morse <james.morse@arm.com>, Kangjie Lu <kjlu@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Qiushi Wu <wu000273@umn.edu>, Robert Richter <rrichter@marvell.com>, Tony Luck <tony.luck@intel.com>

On Fri, May 29, 2020 at 11:40:47AM +0200, Markus Elfring wrote:
> Have we got different programming expectations also around the application
> of the Linux coding style?

We have me stopping you from giving new submitters wrong review and bad
advice.

Please refrain from "reviewing" EDAC patches!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
