From: Yinghai Lu <yinghai@kernel.org>
Date: Tue, 18 Sep 2012 04:46:13 +0000
Subject: Re: [yinghai:master 195/233] drivers/pci/xen-pcifront.c:397:2: error: 'res' undeclared
Message-Id: <CAE9FiQXnOAkKPygZ8xe=VsJgO--7VBwNu+A4B2QTF-K0kuTvNA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120918043223.GA25133@localhost>
In-Reply-To: <20120918043223.GA25133@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 17, 2012 at 9:32 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Yinghai,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git master
> head:   f4e430c2d5fae2ece93207e3e8d06b14d66fcbe4
> commit: b722843995da475accfde984ce41109938ab56e6 [195/233] PCI: Use for_each_res with xen pci
> config: x86_64-allmodconfig
>
> All related error/warning messages:
>
> drivers/pci/xen-pcifront.c: In function 'pcifront_claim_resource':
> drivers/pci/xen-pcifront.c:397:2: error: 'res' undeclared (first use in this function)
> drivers/pci/xen-pcifront.c:397:2: note: each undeclared identifier is reported only once for each function it appears in
>
> vim +397 drivers/pci/xen-pcifront.c
>    392  {
>    393          struct pcifront_device *pdev = data;
>    394          int i;
>    395          struct resource *r;
>    396
>  > 397          for_each_pci_resource(dev, res, i, PCI_ALL_RES) {

thanks. for the reporting, should be r instead of res.

Yinghai
