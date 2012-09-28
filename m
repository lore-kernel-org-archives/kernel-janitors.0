From: Thomas Renninger <trenn@suse.de>
Date: Fri, 28 Sep 2012 16:08:11 +0000
Subject: Re: [tip:x86/acpi 2/6] arch/x86/kernel/setup.c:944:2: error: implicit declaration of function 'acpi_
Message-Id: <201209281808.11405.trenn@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928024651.GH9155@localhost>
In-Reply-To: <20120928024651.GH9155@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Friday, September 28, 2012 07:42:49 AM H. Peter Anvin wrote:
> Thank you, Fengguang!
Yes, thanks!
> 
> Obviously, we will not push this version of this branch.

I obviously should have done this before:
I now removed the old version, I already had added to our
SUSE head branch and added this one.

This should trigger various .config compile options on different
architectures and when builds succeed, I will again post
(privately to hpa again) the patchset.

The bug was to put an empty declaration of:
static inline void arch_reserve_mem_area(acpi_physical_address addr,
                                          size_t size)
{
}
only into !CONFIG_X86 && CONFIG_ACPI defined area.
Result was that kernel did not build on X86 with ACPI not defined.

Another minor change I am going to add is to name the newly
introduced Kconfig option (bool "..."):

config ACPI_INITRD_TABLE_OVERRIDE
        bool "ACPI tables can be passed via uncompressed cpio in initrd"


Question:
Is there a way to get these test builds enabled on a git tree
hosted on git.kernel.org?
I now have an account and if there is some kind of such functionality
I would like to try this out...

Or maybe there is some toolkit so that I can clone my git tree locally
and initiate these test builds here locally?
That would make it easier to pre-test patches in various .configs before
submitting.

Thanks,

   Thomas
