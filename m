From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Wed, 15 Apr 2015 10:50:34 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <8738418y2t.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Wed, Apr 15, 2015 at 01:10:17PM +0300, Alexander Shishkin wrote:
>> How does the following look to you?
>> 
>
> Are you sure you want to know??  :P

Why would I ask if I didn't?

> Of course, I would prefer:
>
> 	return 0;
>
> out_stop:
> 	hwc->state = PERF_HES_STOPPED;
>
> 	return ret;
>
> But your version is also fine.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks,
--
Alex
