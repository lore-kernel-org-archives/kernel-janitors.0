From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 02 Jul 2010 07:04:54 +0000
Subject: Re: [PATCH 10/25] scsi/sg: remove casts from void*
Message-Id: <20100702070454.GA24442@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277990204-22157-1-git-send-email-segooon@gmail.com>
 <20100701173805.GW19184@bicker>
 <20100701182724.GA22466@shinshilla>
In-Reply-To: <20100701182724.GA22466@shinshilla>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, Andrew Morton <akpm@linux-foundation.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Jens Axboe <jens.axboe@oracle.com>, Alexey Dobriyan <adobriyan@gmail.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 01, 2010 at 22:27 +0400, Kulikov Vasiliy wrote:
> The problem is that this driver is not even compileable.
Forget about this.
staging/wlags49_h2/wl_pci.c is not compileable, not scsi/sg.c :)
