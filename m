From: Yinghai Lu <yinghai@kernel.org>
Date: Tue, 25 Sep 2012 19:27:19 +0000
Subject: Re: drivers/pci/search.c:85:2: warning: suggest parentheses around assignment used as truth value
Message-Id: <CAE9FiQUnvwn+MjXaqiKANOQpeOOHg+X8DV0dFBks_JN1PmYdYw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 2:04 AM, Yuanhan Liu <yuanhan.liu@intel.com> wrote:
> Hi Yinghai,
>
> FYI, there are new compile warnings show up in
>
> commit: 73ebfa72e382802b163a354fcb4d8dfea8ab58f3
> title: PCI: kill pci_find_next_bus
> date: 2012-09-25 01:21:07 -0700
> config: x86_64-allyesdebian (attached as .config)
>
>
> All error/warnings:
>
> drivers/edac/i7core_edac.c: In function 'i7core_pci_lastbus':
> drivers/edac/i7core_edac.c:1299:2: warning: suggest parentheses around assignment used as truth value [-Wparentheses]

for checkpatch.pl ?

the code is like:

#define for_each_pci_host_bridge(d) while ((d pci_get_next_host_bridge(d)) != NULL)

so checkpatch.pl need to be fixed.

-Yinghai
