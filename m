From: Tejun Heo <htejun@gmail.com>
Date: Wed, 16 Sep 2015 17:10:00 +0000
Subject: Re: iomap: implement pcim_iounmap_regions()
Message-Id: <20150916171000.GD3243@mtj.duckdns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916160024.GB9735@mwanda>
In-Reply-To: <20150916160024.GB9735@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

On Wed, Sep 16, 2015 at 07:00:24PM +0300, Dan Carpenter wrote:
>    421          for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
>    422                  if (!(mask & (1 << i)))
>    423                          continue;
> 
> Probably maks is always valid is what helps us but basically the static
> checker is suggesting that instead of DEVICE_COUNT_RESOURCE we should
> be using PCI_ROM_RESOURCE or PCIM_IOMAP_MAX.  It could be that this was
> deliberate though...

Looks like a silly mistake on my part.  Care to submit a patch?

Thanks.

-- 
tejun
