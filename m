From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Fri, 01 May 2015 22:59:41 +0000
Subject: RE: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <a4be176855714cc8b54dee925819f917@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <alpine.DEB.2.02.1505011945350.2092@localhost6.localdomain6>
 <524505df3433441494cf082a425f2ee7@EXCHCS32.ornl.gov>
 <DCD755EC-27E3-47CB-9016-D76CBA27AB6C@intel.com>
In-Reply-To: <DCD755EC-27E3-47CB-9016-D76CBA27AB6C@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Drokin, Oleg'" <oleg.drokin@intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

>> Yes the LARGE functions do the switching. I was expecting also patches to remove the 
>> OBD_ALLOC_LARGE functions as well which is not the case here.  I do have one question still. The
>> macro __OBD_MALLOC_VERBOSE allowed the ability to simulate memory allocation failures at
>> a certain percentage rate. Does something exist in the kernel to duplicate that functionality?
>> Once these macros are gone we lose the ability to simulate high memory allocation failures.
>
>Yes, there are things like https://lkml.org/lkml/2014/12/25/64
>So I think the API is even riher compared to what our old wrapper code was able to do.

We should look to integrating that into the test suite.
