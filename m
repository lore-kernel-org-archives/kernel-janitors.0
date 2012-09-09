From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 09 Sep 2012 19:13:01 +0000
Subject: Re: [pci:next 73/77] arch/x86/boot/compressed/eboot.c:283 setup_efi_pci() error: potentially derefen
Message-Id: <20120909191301.GS19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120909121939.GA19908@localhost>
In-Reply-To: <20120909121939.GA19908@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Sep 09, 2012 at 08:19:39PM +0800, Fengguang Wu wrote:
> Hi Matthew,
> 
> FYI, there are new smatch warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> head:   97ac9d1f363964dec7fbb20cf3c2e88336b4d801
> commit: 66f2adcdadea18a583d4f7cbd773847d635731a3 [73/77] EFI: Stash ROMs if they're not in the PCI BAR
> 
> All smatch warnings:
> 
> + arch/x86/boot/compressed/eboot.c:283 setup_efi_pci() error: potentially derefencing uninitialized 'pci_handle'.

These warnings probably have too high of a false positive rate to be
worth emailing about.  Although this one looks like a real bug.  We
should be passing "&pci_handle" to efi_call_phys5 instead of
"pci_handle".

I'm not sure why GCC doesn't warn about these.  Anyway, it's because
GCC didn't warn about unitialized variables that I added it to
Smatch.

> + arch/x86/boot/compressed/eboot.c:303 setup_efi_pci() warn: add some parenthesis here?
> + arch/x86/boot/compressed/eboot.c:303 setup_efi_pci() warn: maybe use && instead of &

These are real but they duplicate Sparse warnings.  :/

>   arch/x86/boot/compressed/eboot.c:728 handle_ramdisks() error: potentially derefencing uninitialized 'fh'.
> 

regards,
dan carpenter

