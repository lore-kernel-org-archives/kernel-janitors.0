From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Thu, 09 Apr 2015 12:47:27 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <87sic98o4g.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> There is no need to free NULL pointers.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice catch!

FWIW,

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
