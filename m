From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 13 Aug 2017 14:37:50 +0000
Subject: Re: [PATCH 0/6] constify pci_error_handlers structures
Message-Id: <20170813143750.GB407@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
 <20170812074451.GA3589@infradead.org>
 <alpine.DEB.2.20.1708120946590.2001@hadrien>
 <20170812075616.GA14976@infradead.org>
 <alpine.DEB.2.20.1708121349080.2001@hadrien>
In-Reply-To: <alpine.DEB.2.20.1708121349080.2001@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Christoph Hellwig <hch@infradead.org>, linux-scsi@vger.kernel.org, bhumirks@gmail.com, kernel-janitors@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org

On Sat, Aug 12, 2017 at 01:51:21PM +0200, Julia Lawall wrote:
> Another issue arises in the files drivers/infiniband/hw/hfi1/pcie.c and
> drivers/infiniband/hw/qib/qib_pcie.c, where the pci_error_handlers
> structure is defined in one file and used in another file.  The structure
> definition references various functions that are static in the same file.
> Should I try to move those functions to the file containing the pci_driver
> structure?  Or leave the functions where they are and remove the static
> annotation?

I'd just leave them as-is and remove the static for now.
