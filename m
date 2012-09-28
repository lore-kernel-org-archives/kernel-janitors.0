From: Josh Triplett <josh@joshtriplett.org>
Date: Fri, 28 Sep 2012 19:16:29 +0000
Subject: Re: [tip:x86/efi 7/11] include/linux/efi.h:501: warning: 'efi_enter_virtual_mode' defined but not us
Message-Id: <20120928191629.GE5202@jtriplet-mobl1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928024115.GD9155@localhost>
In-Reply-To: <20120928024115.GD9155@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2012 at 10:41:15AM +0800, Fengguang Wu wrote:
> include/linux/efi.h:501: warning: 'efi_enter_virtual_mode' defined but not used
> 
> vim +501 include/linux/efi.h
> 
> f383a1e3 (Josh Triplett  2012-09-08  498) #ifdef CONFIG_X86
> ^1da177e (Linus Torvalds 2005-04-16  499) extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
> f383a1e3 (Josh Triplett  2012-09-08  500) #else
> f383a1e3 (Josh Triplett  2012-09-08 @501) static void efi_enter_virtual_mode(void) {}
> f383a1e3 (Josh Triplett  2012-09-08  502) #endif

On Fri, Sep 28, 2012 at 10:45:25AM +0800, Fengguang Wu wrote:
> include/linux/efi.h:503: warning: 'efi_enter_virtual_mode' defined but not used
> include/linux/efi.h:504: warning: 'efi_late_init' defined but not used
> include/linux/efi.h:505: warning: 'efi_free_boot_services' defined but not used
> 
> vim +504 include/linux/efi.h
> 
> f383a1e3 (Josh Triplett  2012-09-08  498) #ifdef CONFIG_X86
> ^1da177e (Linus Torvalds 2005-04-16  499) extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
> ba49efa1 (Josh Triplett  2012-09-08  500) extern void efi_late_init(void);
> 668b132e (Josh Triplett  2012-09-08  501) extern void efi_free_boot_services(void);
> f383a1e3 (Josh Triplett  2012-09-08  502) #else
> f383a1e3 (Josh Triplett  2012-09-08  503) static void efi_enter_virtual_mode(void) {}
> ba49efa1 (Josh Triplett  2012-09-08 @504) static void efi_late_init(void) {}
> 668b132e (Josh Triplett  2012-09-08  505) static void efi_free_boot_services(void) {}
> 
> It's missing 'inline' in the above three lines.

Indeed; both of these come from the same issue.  Will fix.

- Josh Triplett
