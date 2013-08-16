From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Fri, 16 Aug 2013 18:27:31 +0000
Subject: Re: Explanation Needed
Message-Id: <20130816182731.GF7975@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <520E69CA.9060102@gmail.com>
In-Reply-To: <520E69CA.9060102@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 16, 2013 at 11:34:58PM +0530, Kumar Gaurav wrote:
> On Friday 16 August 2013 11:28 PM, Sarah Sharp wrote:
> >On Fri, Aug 16, 2013 at 11:09:12PM +0530, Kumar Gaurav wrote:
> >>Hi Sarah,
> >>
> >>I was just reading through xhci driver's code and found something
> >>which i'm unable to understand use of.
> >>Please help me understanding them
> >>
> >>1.use of struct xhci_hcd in function xhci_readl
> >>     function definition doesn't uses this type of argument
> >>     static inline unsigned int xhci_readl(const struct xhci_hcd *xhci,__le32 __iomem *regs)
> >>     {
> >>         return readl(regs);
> >>     }
> >The function used to print when registers were read, and thus needed the
> >xhci_hcd argument.  It's no longer used, so if you want to submit a
> >patch to remove that argument, I would take it.  Please look at
> >Documentation/SubmittingPatches if you've never submitted a Linux kernel
> >patch before.
> >
> >Sarah Sharp
> Please correct me if i'm wrong, as far as i read "*regs" points to
> the location of register to be read. Then what is use of xhci_hcd?

Are you aware of the `git-log` command?  If you've checked out the
kernel source code with git, rather than downloading a tarball, you can
see all the commits to a file, and use the -p flag to see the full patch
diff.

sarah@xanatos:~/git/kernels/xhci$ git log -p drivers/usb/host/xhci.h

If I search for xhci_readl in that log, eventually I come up with this
commit:

commit f444ff27e9b8c953eef49da65c649fdcd202165a
Author: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date:   Tue Apr 5 15:53:47 2011 -0700

    xhci: STFU: Be quieter during URB submission and completion.
    
    Unsurprisingly, URBs get submitted and completed a lot in the xHCI
    driver.  If we have to print 10 lines of debug for every URB submitted
    or completed, then that can cause the whole system to stay in the
    interrupt handler too long, and can cause Missed Service completion
    codes for isochronous transfers.
    
    Cut down the debugging in the URB submission and completion paths:
     - Don't squawk about successful transfers, only unsuccessful ones.
     - Only print the number of bytes transferred if this was a short
       transfer.
     - Don't print the endpoint index for successful transfers (will add
       more debug to failed transfers to show endpoint index there later).
     - Stop printing MMIO writes.  This debugging shows up when the endpoint
       doorbell is rung a to start a transfer (basically for every URB).
     - Don't print out the ring enqueue and dequeue pointers
     - Stop printing when we're pointing to a link TRB.
    
    Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>

If you look at that commit, you'll see the changes made to xhci_readl():

@@ -1338,9 +1338,6 @@ static inline unsigned int xhci_readl(const struct xhci_hcd *xhci,
 static inline void xhci_writel(struct xhci_hcd *xhci,
                const unsigned int val, __le32 __iomem *regs)
 {
-       xhci_dbg(xhci,
-                       "`MEM_WRITE_DWORD(3'b000, 32'h%p, 32'h%0x, 4'hf);\n",
-                       regs, val);
        writel(val, regs);
 }

You can see from this commit what that argument was previously used for.
As I said, this argument is no longer used, and you can just remove it.

There might be other functions that were modified by that patch (or the
patches around it) that have unused arguments, so you could remove those
as well.  Please note that someone else is already working on a patch to
remove the unused "adjective" argument to xhci_giveback_urb_in_irq.

Sarah Sharp
