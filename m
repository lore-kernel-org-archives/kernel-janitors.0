From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 09 Feb 2007 08:19:28 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <1171008448.10391.10.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2007-02-09 at 08:15 +0100, Richard Knutsson wrote:
> Vignesh Babu BM wrote:
> > Mehul like I said...xdr4.c needs a simple macro that does not check type
> > at all. 
> >
> > But the macro that would work in xdr*.c would look something like the
> > below:
> >
> > #define min_s(x,y) ((x)>(y)?(x):(y))
> >
> > So either we modify min/max in kernel.h - this means a lot more cleanup
> > or add another macro say min_s/max_s --- s for simple :) 
> >
> > Unless we don't do that, it may not be possible to cleanup files like
> > xdr*.c
> >   
> What about __min/__max? At least I usually read the '__'-prefix as 
> something that is a subset of something (and most likely less secure).
> I wrote about this in "[KJ] [RFC] Regarding min/max" (07-02-03) bit 
> since I was not able to find an example I took it as a mistake on my part.
> 
> Richard Knutsson
> 

Just went through the archives....

        I tried to recreate the compile-failure (was some time ago since
        it 
        happened) when using min()/max() in a struct but it happily compiled it 
        so (thankfully) you are correct, just need to use min()/max(). :)
        
        Richard Knutsson
        
Do you mean to say that you were able to compile when the macros were used inside struct?
Im still not able to get that to happen...

I tried that change in linux-2.6/fs/lockd/mon.c

static struct rpc_procinfo	nsm_procedures[] = {
[SM_MON] = {
		.p_proc		= SM_MON,
		.p_encode	= (kxdrproc_t) xdr_encode_mon,
		.p_decode	= (kxdrproc_t) xdr_decode_stat_res,
		.p_bufsiz	= max(SM_mon_sz, SM_monres_sz) << 2,
		.p_statidx	= SM_MON,
		.p_name		= "MONITOR",
	},
[SM_UNMON] = {
		.p_proc		= SM_UNMON,
		.p_encode	= (kxdrproc_t) xdr_encode_unmon,
		.p_decode	= (kxdrproc_t) xdr_decode_stat,
		.p_bufsiz	= max(SM_mon_id_sz, SM_unmonres_sz) << 2,
		.p_statidx	= SM_UNMON,
		.p_name		= "UNMONITOR",
	},
};
-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
