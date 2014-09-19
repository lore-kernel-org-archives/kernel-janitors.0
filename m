From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 19 Sep 2014 03:04:08 +0000
Subject: Re: [HPDD-discuss] [PATCH] staging: lustre: llite: Use kzalloc and rewrite null tests
Message-Id: <517B3353-BD3C-4326-A8F4-F1775B4865E5@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1411071842-24714-1-git-send-email-Julia.Lawall@lip6.fr>
 <1411071842-24714-2-git-send-email-Julia.Lawall@lip6.fr>
 <20140918234309.GP17875@mwanda>
 <E43F4FD2-3A79-485E-960B-A12960B3D2B7@intel.com>
In-Reply-To: <E43F4FD2-3A79-485E-960B-A12960B3D2B7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, "<HPDD-discuss@ml01.01.org>" <HPDD-discuss@ml01.01.org>


On Sep 18, 2014, at 10:57 PM, Drokin, Oleg wrote:

> would not be easy to do. Perhaps registered callbacks for pools that could be called on alloc and on free - though such pools would also need to allow to allocate different sized chunks too).

Come think of it - we don't even need callbacks here. If a pool would allow to allocate different sized chunks of memory. Then on module unmount there's already a warning for freeing
not yet empty pool, and we can even see all the leaked bits if we really want to (in like a crash dump).
So a module would just need to register such a general pool and use it for all allocations.

Bye,
    Oleg