From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 02 May 2008 16:25:39 +0000
Subject: Re: warning: ???pci_find_device??? is deprecated
Message-Id: <20080502162539.GG14976@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 02, 2008 at 05:19:40PM +0100, Ricardo Martins wrote:
> There are 14 drivers in drivers/isdn/hisax/ still using calls to
> pci_find_device() instead of the pci_get_device(). From what I gather, a
> simple sed 's|pci_find_device|pci_get_device|' is enough to fix this,
> since both functions use the same input and give the same output.
> Is this correct?

It's never correct.  If it were that easy (a) there wouldn't be a rename
in the first place and (b) it would have been done with a shell-script
already.

pci_get_device increments a refcount on the pci_dev.  pci_find_device
does not.  Your patch must include calls to pci_dev_put() *when
appropriate*.  Note, for example, that pci_get_device decrements the
refcount on the device passed in.

> Also, since there are 14 drivers with only those 1-line changes, should each
> driver have its own patch or could I send a single patch covering all of
> them?

It's not going to be a 1-line patch, so one per driver.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
