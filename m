From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Tue, 03 Aug 2010 15:45:17 +0000
Subject: Re: [PATCH 08/11] x86: intel_ips: do not use PCI resources before
Message-Id: <20100803084517.4e4cafc9@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280850257-6169-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280850257-6169-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Jiri Slaby <jslaby@suse.cz>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue,  3 Aug 2010 19:44:16 +0400
Kulikov Vasiliy <segooon@gmail.com> wrote:

> IRQ and resource[] may not have correct values until
> after PCI hotplug setup occurs at pci_enable_device() time.
> 
> The semantic match that finds this problem is as follows:
> 
> // <smpl>
> @@
> identifier x;
> identifier request ~= "pci_request.*|pci_resource.*";
> @@
> 
> (
> * x->irq
> |
> * x->resource
> |
> * request(x, ...)
> )
>  ...
> *pci_enable_device(x)
> // </smpl>
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/platform/x86/intel_ips.c |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)

Yep, thanks.

Reviewed-by: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
Jesse Barnes, Intel Open Source Technology Center
