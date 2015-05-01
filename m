From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Fri, 01 May 2015 20:18:56 +0000
Subject: RE: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <524505df3433441494cf082a425f2ee7@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <alpine.DEB.2.02.1505011945350.2092@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1505011945350.2092@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Julia Lawall' <julia.lawall@lip6.fr>
Cc: Oleg Drokin <oleg.drokin@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

>> >From: Julia Lawall <Julia.Lawall@lip6.fr>
>> >
>> >Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
>> >kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.
>> 
>> Nak: James Simmons <jsimmons@infradead.org>
>> 
>> A simple replace will not work. The OBD_ALLOC and OBD_FREE functions allocate memory
>> anywhere from one page to 4MB in size. You can't use kmalloc for the 4MB allocations.
>> Currently lustre uses  a 4 page water mark to determine if we allocate using vmalloc. Even
>> using kmalloc for 4 pages has shown high failure rates on some systems. It gets even more
>> messy with 64K page systems like ppc64 boxes. Now I'm not suggesting to port the larger
>> allocations to vmalloc either since issues have been founded with using vmalloc. For example
>> when using large stripe count files the MDS rpc generated crosses the 4 page line and vmalloc
>> is used. Using vmalloc caused a global spinlock to be taken which causes meta data operations
>> to serialized on the MDS servers.
>
>It's not the LARGE functions that do the switching?  For example OBD_ALLOC 
>ends up at  __OBD_MALLOC_VERBOSE, which as far as I can see calls kmalloc 
>(with __GFP_ZERO, and hance the use of kzalloc).

Yes the LARGE functions do the switching. I was expecting also patches to remove the 
OBD_ALLOC_LARGE functions as well which is not the case here.  I do have one question still. The
macro __OBD_MALLOC_VERBOSE allowed the ability to simulate memory allocation failures at
a certain percentage rate. Does something exist in the kernel to duplicate that functionality?
Once these macros are gone we lose the ability to simulate high memory allocation failures.


