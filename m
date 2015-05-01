From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 01 May 2015 20:49:26 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <DCD755EC-27E3-47CB-9016-D76CBA27AB6C@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <alpine.DEB.2.02.1505011945350.2092@localhost6.localdomain6>
 <524505df3433441494cf082a425f2ee7@EXCHCS32.ornl.gov>
In-Reply-To: <524505df3433441494cf082a425f2ee7@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Simmons, James A." <simmonsja@ornl.gov>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>


On May 1, 2015, at 4:18 PM, Simmons, James A. wrote:

> Yes the LARGE functions do the switching. I was expecting also patches to remove the 
> OBD_ALLOC_LARGE functions as well which is not the case here.  I do have one question still. The
> macro __OBD_MALLOC_VERBOSE allowed the ability to simulate memory allocation failures at
> a certain percentage rate. Does something exist in the kernel to duplicate that functionality?
> Once these macros are gone we lose the ability to simulate high memory allocation failures.

Yes, there are things like https://lkml.org/lkml/2014/12/25/64
So I think the API is even riher compared to what our old wrapper code was able to do.

Bye,
    Oleg