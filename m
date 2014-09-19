From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Sep 2014 09:11:51 +0000
Subject: Re: [PATCH] staging: lustre: llite: Use kzalloc and rewrite null tests
Message-Id: <20140919091151.GQ17875@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1411071842-24714-1-git-send-email-Julia.Lawall@lip6.fr>
 <1411071842-24714-2-git-send-email-Julia.Lawall@lip6.fr>
 <20140918234309.GP17875@mwanda>
 <E43F4FD2-3A79-485E-960B-A12960B3D2B7@intel.com>
In-Reply-To: <E43F4FD2-3A79-485E-960B-A12960B3D2B7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Drokin, Oleg" <oleg.drokin@intel.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, "Dilger, Andreas" <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "<HPDD-discuss@ml01.01.org>" <HPDD-discuss@ml01.01.org>

On Fri, Sep 19, 2014 at 02:57:03AM +0000, Drokin, Oleg wrote:
> 4. Sometimes we need large allocations. general kmalloc is less
> reliable as system lives on and memory fragmentation worsens. So we
> have this "allocations over 2-4 pages get switched to vmalloc" logic,
> if there's a way to do that automatically - that would be great.

Julia's patch only changes OBD_ALLOC() functions and those are always
kmalloc so that's not an issue here.

The OBD_ALLOC_LARGE() macro is vmalloc() or kmalloc() if the size is
small enough.  We don't really want to choose between kmalloc and
vmalloc automatically.  My instinct is that we should change all the
OBD_ALLOC_LARGE() to vmalloc() and trust it to allocate them in the most
sane way possible.  But I haven't really looked very closely.

regards,
dan carpenter

