From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Fri, 01 May 2015 22:57:45 +0000
Subject: RE: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <ca81374659ea4e1c8f62c779d052717e@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <alpine.DEB.2.02.1505011945350.2092@localhost6.localdomain6>
 <524505df3433441494cf082a425f2ee7@EXCHCS32.ornl.gov>
 <20150501204729.GA2265@kroah.com>
In-Reply-To: <20150501204729.GA2265@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: 'Julia Lawall' <julia.lawall@lip6.fr>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Oleg Drokin <oleg.drokin@intel.com>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

>> Yes the LARGE functions do the switching. I was expecting also patches to remove the 
>> OBD_ALLOC_LARGE functions as well which is not the case here.  I do have one question still. The
>> macro __OBD_MALLOC_VERBOSE allowed the ability to simulate memory allocation failures at
>> a certain percentage rate. Does something exist in the kernel to duplicate that functionality?
>
>Yes, no need for lustre to duplicate yet-another-thing the kernel
>already provides :)

The reason for this is that libcfs was written 10+ years ago which was before linux had such nice
features. At that time it was needed to fill the gaps missing which is no longer the case. Libcfs is
really showing its age :-)
