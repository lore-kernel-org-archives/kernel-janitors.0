From: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Sun, 08 Jul 2012 14:27:46 +0000
Subject: Re: [pm:linux-next 69/69] drivers/base/power/main.c:470:2: error: implicit declaration of function '
Message-Id: <201207081627.46331.rjw@sisk.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120708051704.GA8796@localhost>
In-Reply-To: <20120708051704.GA8796@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Sunday, July 08, 2012, wfg@linux.intel.com wrote:
> Hi Preeti,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> head:   e35a051fe5987ee9f6757d962ba37920757faee5
> commit: e35a051fe5987ee9f6757d962ba37920757faee5 [69/69] PM / cpuidle: System resume hang fix with cpuidle
> config: i386-allnoconfig (attached as .config)
> 
> All related error/warning messages:
> 
> drivers/base/power/main.c: In function 'dpm_resume_noirq':
> drivers/base/power/main.c:470:2: error: implicit declaration of function 'cpuidle_resume' [-Werror=implicit-function-declaration]
> drivers/base/power/main.c: In function 'dpm_suspend_noirq':
> drivers/base/power/main.c:871:2: error: implicit declaration of function 'cpuidle_pause' [-Werror=implicit-function-declaration]
> 
> drivers/base/power/main.c
>    467		mutex_unlock(&dpm_list_mtx);
>    468		dpm_show_time(starttime, state, "noirq");
>    469		resume_device_irqs();
>  > 470		cpuidle_resume();
>    471	}
>    472	
>    473	/**

This most likely is due to CONFIG_CPU_IDLE unset.  I fixed it up in my tree,
should be OK now.

Thanks,
Rafael
