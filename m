From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 09:40:47 +0000
Subject: Re: [PATCH] edac: Fix reference count leak in edac_device_register_sysfs_main_kobj()
Message-Id: <c304a0b0-692a-0696-6750-05a3db6a4b42@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <28ebc99f-c0dd-00b2-7a53-9edf0df36c9c@web.de>
 <20200529093644.GC9011@zn.tnic>
In-Reply-To: <20200529093644.GC9011@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Morse <james.morse@arm.com>, Kangjie Lu <kjlu@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Qiushi Wu <wu000273@umn.edu>, Robert Richter <rrichter@marvell.com>, Tony Luck <tony.luck@intel.com>

>> * The label “err_out” can be replaced by direct return statement,
>>   can't it?
>
> No, it cannot. It keeps the error handling code out-of-line so that the
> function body remains readable.

Have we got different programming expectations also around the application
of the Linux coding style?

Regards,
Markus
