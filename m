From: Joe Perches <joe@perches.com>
Date: Sun, 08 Mar 2020 20:13:38 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: include GOOGLE FIRMWARE entry
Message-Id: <0738b8e5422e60cabfbf58d5d812da20128be750.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2020-03-08 at 20:51 +0100, Lukas Bulwahn wrote:
> All files in drivers/firmware/google/ are identified as part of THE REST
> according to MAINTAINERS, but they are really maintained by others.
> 
> Add a basic entry for drivers/firmware/google/ based on a simple statistics
> on tags of commits in that directory:
> 
>   $ git log drivers/firmware/google/ | grep '\-by:' \
>       | sort | uniq -c | sort -nr
>      62     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>      13     Reviewed-by: Guenter Roeck <groeck@chromium.org>
>      12     Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>      11     Reviewed-by: Julius Werner <jwerner@chromium.org>
> 
> There is no specific mailing list for this driver, based on observations
> on the patch emails, and the git history suggests the driver is maintained.

The sign-off list is definitely not the MAINTAINER list
as that sign-off list can identify the upstreaming path
and not the actual maintainers.

You should instead try to identify the MAINTAINERS as authors
of the various patches rather than the sign-off list.

And even then you need to isolate the trivial changes from
the actual defect correction and significant features added.

And also time-limit the range of commits as people come and
go and only relatively recent changes should be analyzed.

For instance:

$ git log --since=2-years-ago --no-merges --pretty="%aN <%aE>	%s" -- drivers/firmware/google
Gustavo A. R. Silva <gustavo@embeddedor.com>    firmware: google: vpd: Replace zero-length array with flexible-array member
Gustavo A. R. Silva <gustavo@embeddedor.com>    firmware: google: memconsole: Replace zero-length array with flexible-array member
Arthur Heymans <arthur@aheymans.xyz>    firmware: google: Probe for a GSMI handler in firmware
Arthur Heymans <arthur@aheymans.xyz>    firmware: google: Unregister driver_info on failure and exit in gsmi
Patrick Rudolph <patrick.rudolph@9elements.com> firmware: google: Release devices before unregistering the bus
Brian Norris <briannorris@chromium.org> firmware: google: increment VPD key_len properly
Hung-Te Lin <hungte@chromium.org>       firmware: google: check if size is valid when decoding VPD data
Thomas Gleixner <tglx@linutronix.de>    treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 287
Stephen Boyd <swboyd@chromium.org>      firmware: google: coreboot: Drop unnecessary headers
Stephen Boyd <swboyd@chromium.org>      firmware: google: memconsole: Drop global func pointer
Stephen Boyd <swboyd@chromium.org>      firmware: google: memconsole: Drop __iomem on memremap memory
Stephen Boyd <swboyd@chromium.org>      firmware: google: memconsole: Use devm_memremap()
Stephen Boyd <swboyd@chromium.org>      firmware: google: Add a module_coreboot_driver() macro and use it
Thomas Gleixner <tglx@linutronix.de>    treewide: Add SPDX license identifier - Makefile/Kconfig
Thomas Gleixner <tglx@linutronix.de>    treewide: Add SPDX license identifier for more missed files
Stephen Boyd <swboyd@chromium.org>      firmware: vpd: Drop __iomem usage for memremap() memory
Furquan Shaikh <furquan@chromium.org>   gsmi: Add GSMI commands to log S0ix info
Duncan Laurie <dlaurie@chromium.org>    gsmi: Remove autoselected dependency on EFI and EFI_VARS
Duncan Laurie <dlaurie@chromium.org>    gsmi: Add coreboot to list of matching BIOS vendors
Duncan Laurie <dlaurie@chromium.org>    gsmi: Fix bug in append_to_eventlog sysfs handler
Colin Ian King <colin.king@canonical.com>       firmware: vpd: fix spelling mistake "partion" -> "partition"
Stephen Boyd <swboyd@chromium.org>      firmware: coreboot: Only populate devices in coreboot_table_init()
Stephen Boyd <swboyd@chromium.org>      firmware: coreboot: Remap RAM with memremap() instead of ioremap()
Stephen Boyd <swboyd@chromium.org>      firmware: coreboot: Collapse platform drivers into bus core
Stephen Boyd <swboyd@chromium.org>      firmware: coreboot: Make bus registration symmetric
Stephen Boyd <swboyd@chromium.org>      firmware: coreboot: Unmap ioregion after device population
Stephen Boyd <swboyd@chromium.org>      firmware: coreboot: Let OF core populate platform device
Colin Ian King <colin.king@canonical.com>       firmware: google: make structure gsmi_dev static
Anton Vasilyev <vasilyev@ispras.ru>     firmware: vpd: Fix section enabled flag on vpd_section_destroy
Samuel Holland <samuel@sholland.org>    firmware: coreboot: Add coreboot framebuffer driver
Samuel Holland <samuel@sholland.org>    firmware: coreboot: Remove unused coreboot_table_find
Samuel Holland <samuel@sholland.org>    firmware: vpd: Probe via coreboot bus
Samuel Holland <samuel@sholland.org>    firmware: memconsole: Probe via coreboot bus
Samuel Holland <samuel@sholland.org>    firmware: coreboot: Expose the coreboot table as a bus

Thomas Gleixner did licensing changes treewide which
would have no maintainer role, Gustavo Silva did generic
style changes and Stephen Boyd is really the only party
here that has done fundamental changes.

It's not an easy problem, but adding
