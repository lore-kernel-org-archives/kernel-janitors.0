From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 01 May 2015 18:49:39 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <CE79FA38-6072-441F-ADA2-F864264F09E9@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <alpine.DEB.2.02.1505011945350.2092@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1505011945350.2092@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "Simmons, James A." <simmonsja@ornl.gov>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

Hello!

On May 1, 2015, at 1:48 PM, Julia Lawall wrote:
>>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>> 
>>> Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
>>> kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.
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
> It's not the LARGE functions that do the switching?  For example OBD_ALLOC 
> ends up at  __OBD_MALLOC_VERBOSE, which as far as I can see calls kmalloc 
> (with __GFP_ZERO, and hance the use of kzalloc).

This is true. We have OBD_ALLOC that is straight kmalloc and then we have OBD_ALLOC_LARGE
that depends on allocation size whenever it's kmalloc or vmalloc.

Similarly we have OBD_FREE and OBD_FREE_LARGE (This one could be converted straight into kvfree).

I think the patches look fine.

Bye,
    Oleg