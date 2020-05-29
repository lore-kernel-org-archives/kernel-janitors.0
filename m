From: Borislav Petkov <bp@alien8.de>
Date: Fri, 29 May 2020 09:36:44 +0000
Subject: Re: [PATCH] edac: Fix reference count leak in edac_device_register_sysfs_main_kobj()
Message-Id: <20200529093644.GC9011@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <28ebc99f-c0dd-00b2-7a53-9edf0df36c9c@web.de>
In-Reply-To: <28ebc99f-c0dd-00b2-7a53-9edf0df36c9c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Qiushi Wu <wu000273@umn.edu>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Morse <james.morse@arm.com>, Kangjie Lu <kjlu@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rrichter@marvell.com>, Tony Luck <tony.luck@intel.com>

On Fri, May 29, 2020 at 11:20:42AM +0200, Markus Elfring wrote:
> * The label “err_out” can be replaced by direct return statement,
>   can't it?

No, it cannot. It keeps the error handling code out-of-line so that the
function body remains readable.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
