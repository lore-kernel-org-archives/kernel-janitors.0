From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Sun, 27 Aug 2006 04:06:20 +0000
Subject: Re: [KJ] memory leak fix in acpi_memhotplug.c,
Message-Id: <6b4e42d10608262106ibc44172h3eb3e6f68ba8a062@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10608261721h7807e45h6f20a2327f368719@mail.gmail.com>
	 <200608262143.37390.len.brown@intel.com>
In-Reply-To: <200608262143.37390.len.brown@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On 8/26/06, Len Brown <len.brown@intel.com> wrote:
> On Saturday 26 August 2006 20:21, Om Narasimhan wrote:
> > Hi,
> > This patch fixes one memory leak in drivers/acpi/acpi_memhotplug.c
> > Replaces all kmalloc() calls succeeded by memset() to kzalloc() calls.
> > Applies cleanly to 2.6.18-rc4. Compile tested.
>
> Compile testing is more effective is you use a .config that
> builds each of the source files changed.
I have compiled it with .config files resulting from targets
'allmodconfig' and 'allyesconfig'.
> > diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
> > index b0d4b14..eb8a5da 100644
> > --- a/drivers/acpi/acpi_memhotplug.c
> > +++ b/drivers/acpi/acpi_memhotplug.c
> > @@ -297,6 +297,7 @@ static int acpi_memory_disable_device(st
> >        * Ask the VM to offline this memory range.
> >        * Note: Assume that this function returns zero on success
> >        */
> > +     struct acpi_memory_info *info, *n;
>
> What tree is this patch against?
> This line is already present (above the comment) in 2.6.18-rc4.
This surprises me. This patch is against 2.6.18-rc4, git-pull -ed today morning.
Maybe I should do one more git-pull?

Thanks,
Om N
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
