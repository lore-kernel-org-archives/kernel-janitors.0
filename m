From: Greg KH <greg@kroah.com>
Date: Thu, 15 Feb 2007 18:13:28 +0000
Subject: Re: [KJ] working on pci_find_device cleanup
Message-Id: <20070215181328.GB27876@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171512459.2354.4.camel@bluegenie>
In-Reply-To: <1171512459.2354.4.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 15, 2007 at 09:37:39AM +0530, Surya wrote:
> Hi List,
>    Just wanted to announce that I am working on the cleanup of
> pci_find_device. Have updated the wiki for the same.

Good luck, it is one of the harder things to properly do, a lot of the
cleanups will require switching to the "newer" pci driver api instead.
Search the archives of this list for details.

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
