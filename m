From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 20:57:01 +0000
Subject: Re: [patch] PCI: set ->mask_pos correctly
Message-Id: <20130430205701.GG5072@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430074454.GF7237@elgon.mountain>
 <CAErSpo64WyM=4c3WC8hy-xy2gNgWtkJVTqzawRU6d6=t6nxnoQ@mail.gmail.com>
In-Reply-To: <CAErSpo64WyM=4c3WC8hy-xy2gNgWtkJVTqzawRU6d6=t6nxnoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Apr 30, 2013 at 10:45:35AM -0600, Bjorn Helgaas wrote:
> On Tue, Apr 30, 2013 at 1:44 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > The "+" operation has higher precedence than "?:" and ->msi_cap is
> > always non-zero here so the original statement is equivalent to:
> >
> >         entry->mask_pos = PCI_MSI_MASK_64;
> >
> > Which wasn't the intent.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Ouch, my fault, sorry about that.  Thanks for finding this.  I put
> this in my for-linus branch and will try to get this in before
> v3.10-rc1.
> 
> How did you find this?  I guess MSI didn't work right on a device with
> 32-bit message address and per-vector masking?
> 

Static analysis.  I have a check that complains about every
condition like:

	if (foo + bar) { ...

It has too many false positives to foist on the public though.

regards,
dan carpenter


