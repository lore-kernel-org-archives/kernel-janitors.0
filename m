From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 20 Aug 2012 13:15:55 +0000
Subject: Re: [platform-drivers-x86:linux-next 7/12] warning: (DRM_RADEON_KMS && DRM_I915 && STUB_POULSBO && F
Message-Id: <20120820131555.GA6601@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120818005028.GA5201@localhost>
In-Reply-To: <20120818005028.GA5201@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 20, 2012 at 08:05:43AM -0500, Seth Forshee wrote:
> On Sat, Aug 18, 2012 at 08:50:28AM +0800, Fengguang Wu wrote:
> > Hi Seth,
> > 
> > FYI, there are compile warnings in
> > 
> > tree:   git://cavan.codon.org.uk/platform-drivers-x86 linux-next
> > head:   973713edb3163c0386e36826166308f95adf87e4
> > commit: 16caa01ccb35a99f919143f78fb94d91426c45a4 [7/12] apple-gmux: Fix kconfig dependencies
> > config: i386-randconfig-b820 (attached as .config)
> > 
> > All error/warnings:
> > 
> > warning: (DRM_RADEON_KMS && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
> > warning: (DRM_NOUVEAU) selects ACPI_WMI which has unmet direct dependencies (X86 && X86_PLATFORM_DEVICES && ACPI)
> > warning: (DRM_NOUVEAU) selects MXM_WMI which has unmet direct dependencies (X86 && X86_PLATFORM_DEVICES && ACPI_WMI)
> > warning: (DRM_RADEON_KMS && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
> > warning: (DRM_NOUVEAU) selects ACPI_WMI which has unmet direct dependencies (X86 && X86_PLATFORM_DEVICES && ACPI)
> > warning: (DRM_NOUVEAU) selects MXM_WMI which has unmet direct dependencies (X86 && X86_PLATFORM_DEVICES && ACPI_WMI)
> 
> Hi Fengguang,
> 
> Why was this commit identified as producing these warnings? I can't see
> the relationship, and if I revert that commit or reset my HEAD to the
> commit just prior to that one I still see them. I get the same warnings
> in Linus's tree too, which doesn't have that commit.

Seth, yeah these may not related to the commit.  In these warnings, I
see some "relation" between your tree name platform-drivers-x86 and
X86_PLATFORM_DEVICES, so decided to forward them to you.. Sorry if
this makes confusions/noises to you!

Thanks,
Fengguang
