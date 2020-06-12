From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Jun 2020 17:38:38 +0000
Subject: Re: [PATCH] coresight: cti: Fix error handling in probe
Message-Id: <20200612173838.GH4282@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200612121047.GF4282@kadam> <20200612121133.GA1139533@mwanda>
 <6c59bdbc15714b089d256ad50aee58cb@bfs.de>
In-Reply-To: <6c59bdbc15714b089d256ad50aee58cb@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Leach <mike.leach@linaro.org>

On Fri, Jun 12, 2020 at 02:11:16PM +0000, Walter Harms wrote:
> Hi Dan,
> 
> nit picking in cti_pm_release()
> 
> IMHO this should be done in 2 steps:
>       if (--nr_cti_cpu = 0)
> ->
>   --nr_cti_cpu ;
>  if ( nr_cti_cpu = 0)

The first way is sort of the more canonical way to write it...  By far.

regards,
carpenter
