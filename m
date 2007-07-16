From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 16 Jul 2007 15:03:25 +0000
Subject: Re: [PATCH] change pci_find_device to pci_get_device,
Message-Id: <20070716150324.GJ13826@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11845693593123-git-send-email-crquan@gmail.com>
In-Reply-To: <11845693593123-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 16, 2007 at 10:53:33PM +0800, rae l wrote:
> I don't know how to solve this problem, I just want to do some kernel
> janitors project to contribute to the linux kernel, I'm just a kernel
> newbie;

Pick an easier project; this one is too intricate.

> Because the pci_find_device is deprecated, the comments in this
> function said, please use pci_get_device instead; but pci_get_device
> called here return a (struct pci_dev *) to a local variable, someone
> could tell me when to call pci_put_device?

The correct way to do this is to convert the driver to use the
pci_register_driver API.  I'm taking a stab at it now -- and let me
assure you that it's not easy.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
