From: Greg KH <greg@kroah.com>
Date: Thu, 20 May 2010 15:36:16 +0000
Subject: Re: [PATCH 09/11] Staging: hv: Storage class should be before
Message-Id: <20100520153616.GA4418@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1274344778-9209-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1274344778-9209-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 20, 2010 at 01:53:34AM -0700, Joe Perches wrote:
> On Thu, 2010-05-20 at 10:39 +0200, Tobias Klauser wrote:
> > +++ b/drivers/staging/hv/vmbus_drv.c
> > -const static struct pci_device_id microsoft_hv_pci_table[] = {
> > +static const struct pci_device_id microsoft_hv_pci_table[] = {
> >         { PCI_DEVICE(0x1414, 0x5353) }, /* VGA compatible controller
> > */
> >         { 0 }
> >  }; 
> 
> DEFINE_PCI_DEVICE_TABLE ?

No, I hate that macro.
