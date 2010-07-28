From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Wed, 28 Jul 2010 00:10:02 +0000
Subject: Re: [patch -next] ixgbe: potential null dereference
Message-Id: <AANLkTim5LGj0KGs-0fGGAka7Fde3=NVVXWYBLbb_kVMs@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100727100556.GM26313@bicker>
In-Reply-To: <20100727100556.GM26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mallikarjuna R Chilakala <mallikarjuna.chilakala@intel.com>, e1000-devel@lists.sourceforge.net, Bruce Allan <bruce.w.allan@intel.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, John Ronciak <john.ronciak@intel.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, Jul 27, 2010 at 03:05, Dan Carpenter <error27@gmail.com> wrote:
> The e_dev_err() macro dereferences "adapter" which is NULL here.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
