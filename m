From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 12 Apr 2015 09:51:24 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <alpine.DEB.2.02.1504121149210.2112@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > 2) Exit labels bad associations because code which uses err: or out:
> >    labels is often buggy as we have seen in pt_event_add().
> 
> Not if the cleanup path is robustly constructed. Multiple labels can 
> also be used:
> 
>   - if performance is of concern
>   - if we need to unroll layers of taken locks

A cascade of labels helps the reader understand what goes with what, in
what order, because functions are not called when they are not needed.

julia
