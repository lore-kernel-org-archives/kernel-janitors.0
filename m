From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Sep 2012 19:49:02 +0000
Subject: Re: drivers/pci/search.c:85:2: warning: suggest parentheses around assignment used as truth value
Message-Id: <20120925194901.GV4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAE9FiQUnvwn+MjXaqiKANOQpeOOHg+X8DV0dFBks_JN1PmYdYw@mail.gmail.com>
In-Reply-To: <CAE9FiQUnvwn+MjXaqiKANOQpeOOHg+X8DV0dFBks_JN1PmYdYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 12:27:19PM -0700, Yinghai Lu wrote:
> On Tue, Sep 25, 2012 at 2:04 AM, Yuanhan Liu <yuanhan.liu@intel.com> wrote:
> > Hi Yinghai,
> >
> > FYI, there are new compile warnings show up in
> >
> > commit: 73ebfa72e382802b163a354fcb4d8dfea8ab58f3
> > title: PCI: kill pci_find_next_bus
> > date: 2012-09-25 01:21:07 -0700
> > config: x86_64-allyesdebian (attached as .config)
> >
> >
> > All error/warnings:
> >
> > drivers/edac/i7core_edac.c: In function 'i7core_pci_lastbus':
> > drivers/edac/i7core_edac.c:1299:2: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
> 
> for checkpatch.pl ?
> 

GCC.

> the code is like:
> 
> #define for_each_pci_host_bridge(d) while ((d > pci_get_next_host_bridge(d)) != NULL)

In 73ebfa72e3828 "PCI: kill pci_find_next_bus" it doesn't have the
extra parens.

7b543663 (Yinghai Lu                    2012-04-02 18:31:53 -0700  396) #define to_pci_host_bridge(n) container_of(n, struct pci_host_bridge, dev)
573a6050 (Yinghai Lu                    2012-09-25 01:21:06 -0700  397) #define for_each_pci_host_bridge(d) while (d = pci_get_next_host_bridge(d))
573a6050 (Yinghai Lu                    2012-09-25 01:21:06 -0700  398) 

Maybe this got fixed later?  Fengguang is probably testing
individual patches.  If it's a non-rebase tree he has a way to mark
those...

regards,
dan carpenter

