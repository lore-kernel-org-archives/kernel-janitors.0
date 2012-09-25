From: Yinghai Lu <yinghai@kernel.org>
Date: Tue, 25 Sep 2012 16:35:39 +0000
Subject: Re: arch/alpha/kernel/pci.c:311:25: error: 'bridge' undeclared
Message-Id: <CAE9FiQUkVhF4i_VqxNbYi+tTYiGD7Jv5adcgTSWjuOn_+pBw=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120925091426.GB27512@localhost>
In-Reply-To: <20120925091426.GB27512@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 2:14 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Yinghai,
>
> FYI, kernel build failed on
>
> commit: e77e2cb0193c67de446ad32579348b9c846f5034 PCI, alpha: kill pci_root_buses
> config: alpha-defconfig
>
>
> All error/warnings:
>
> arch/alpha/kernel/pci.c: In function 'pcibios_claim_console_setup':
> arch/alpha/kernel/pci.c:310:2: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
> arch/alpha/kernel/pci.c:311:25: error: 'bridge' undeclared (first use in this function)
> arch/alpha/kernel/pci.c:311:25: note: each undeclared identifier is reported only once for each function it appears in
>
> vim +311 arch/alpha/kernel/pci.c
>    305  static void __init
>    306  pcibios_claim_console_setup(void)
>    307  {
>    308          struct pci_host_bridge *host_bridge = NULL;
>    309
>    310          for_each_pci_host_bridge(host_bridge)
>  > 311                  pcibios_claim_one_bus(bridge->bus);

Fixed.

Thanks
