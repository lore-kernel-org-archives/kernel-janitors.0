From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Sat, 02 May 2015 01:18:48 +0000
Subject: RE: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <656a59e6fdb043df94afda4683cd23d1@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>> >We are hopefully going to get rid of OBD_ALLOC_LARGE() as well, though.
>> >
>> >It's simple enough to write a function:
>> >
>> >void *obd_zalloc(size_t size)
>> >{
>> >	if (size > 4 * PAGE_CACHE_SIZE)
>> >		return vzalloc(size);
>> >	else
>> >		return kmalloc(size, GFP_NOFS);
>> >}
>> >
>> >Except, huh?  Shouldn't we be using GFP_NOFS for the vzalloc() side?
>> >There was some discussion of that GFP_NOFS was a bit buggy back in 2010
>> >(http://marc.info/?l=linux-mm&m8942194520631&w=4) but the current
>> >lustre code doesn't try to pass GFP_NOFS.
>> 
>> The version in the upstream client is out of date. The current macro in the Intel master
>> Branch is:
>
>That's not helpful at all, why do we even have an in-kernel version of
>this code if you don't do your development in the kernel?
>
>Please sync with the kernel tree very soon, or I'm just going to delete
>this whole thing.  This is getting _really_ frustrating.

First I want to make it clear I am here to help clean up the upstream client. I agree in the long run
it is important to move the development to what is in the upstream kernel but their is reason why
current development is not focus in the upstream client. 

       As the primary engineer responsible for the deployment of Lustre at ORNL I have to ensure
Lustre runs flawlessly. There is zero tolerance of problems or even the slightest performance
degradation. Trust me the users scream even when 1% performance is lost. The amazing 
thing is we have less then 1% down time during the year. To do this I have to perform hundreds
of hours of testing at various scales for various versions of Lustre. This includes taking time on Titan.
So what does this have to do with upstream testing. Well no super computer in the world runs the 
latest and greatest linux kernel so the focus is just not there. Luckily the lab does see it is in its interest
to support the upstream client work otherwise I wouldn't be here :-)
      Second and far more importantly the upstream lustre code currently does not have the same 
level of QA with what the Intel branch gets.  The bar is very very high to get any patch merged for the
Intel branch. Each patch has to first pass a regression test suite besides the normal review process.
Besides that sites like ORNL have to evaluated all the changes at all the scales present on site. This
means doing testing on Titan because unique problems only show up at that scale. Because of this
the work that will soon come your way has to be first evaluated on the Intel branch since this is the
current path for QA. You can think of the intel branch as a lustre-next branch that needs to be feed back
too your branch. Eventually your branch will have to under go this level of QA but we are not quite
their yet.

     Now I like to see the current situation change and Greg you have know me for a while so you 
can expect a lot of changes are coming.  In fact I already have rallied people from vendors outside Intel
as well as universities which have done some excellent work which you will soon see. Now I hope this
is the last email I do like this. Instead I just want to send you patches. Greg I think the changes you will
see soon will remove your frustration.
