From: jonghwa3.lee@samsung.com
Date: Fri, 31 Aug 2012 06:57:41 +0000
Subject: Re: [samsung:devfreq-for-next 3/5] drivers/devfreq/devfreq.c:75:5: sparse: symbol 'devfreq_get_freq_
Message-Id: <50406065.1040902@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120831065402.GA6761@localhost>
In-Reply-To: <20120831065402.GA6761@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 2012년 08월 31일 15:54, Fengguang Wu wrote:

> Hi Jonghwa,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.infradead.org/users/kmpark/linux-samsung devfreq-for-next
> head:   90609cd121f47446e6a04862214423dbc75bd493
> commit: 4b77f78761889635ba1abd2f4ec1e7f45012e48c [3/5] devfreq: Add sysfs node for representing frequency transition information.
> 
> All sparse warnings:
> 
> + drivers/devfreq/devfreq.c:75:5: sparse: symbol 'devfreq_get_freq_level' was not declared. Should it be static?
> + drivers/devfreq/devfreq.c:86:5: sparse: symbol 'devfreq_update_status' was not declared. Should it be static?
> 
> vim +75 drivers/devfreq/devfreq.c
>     72		return ERR_PTR(-ENODEV);
>     73	}
>     74	
>   > 75	int devfreq_get_freq_level(struct devfreq *devfreq, unsigned long freq)
>     76	{
>     77		int lev;
>     78	
> 
> Please consider folding the attached diff :-)
> 


Okay, I'll updated it.

> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation


