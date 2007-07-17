From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 17 Jul 2007 01:30:18 +0000
Subject: Re: [PATCH] change pci_find_device to pci_get_device,
Message-Id: <20070717013018.GR13826@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11845693593123-git-send-email-crquan@gmail.com>
In-Reply-To: <11845693593123-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 16, 2007 at 05:09:47PM -0700, Greg KH wrote:
> Please read the comments for the pci_get_device() function to fully
> understand why people have not just gone through and done a simple
> search-and-replace action for the whole kernel tree.  It is much more
> complex than that.

Yes, it is.  Here's my solution:

http://marc.info/?l=linux-scsi&m8462846525015&w=2
http://marc.info/?l=linux-scsi&m8462738926857&w=2
http://marc.info/?l=linux-scsi&m8463215810772&w=2
http://marc.info/?l=linux-scsi&m8462771422817&w=2

Untested, as I don't have the hardware.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
