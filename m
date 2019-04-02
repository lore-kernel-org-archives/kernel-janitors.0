From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Apr 2019 12:50:28 +0000
Subject: Re: [PATCH 7/7] cpufreq: ppc_cbe: fix possible object reference leak
Message-Id: <89ab8dd4-e997-1796-a522-863ff511bb58@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554082674-2049-8-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1554082674-2049-8-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Yi Wang <wang.yi59@zte.com.cn>

> @@ -86,6 +86,7 @@ static int cbe_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	if (!cbe_get_cpu_pmd_regs(policy->cpu) ||
>  	    !cbe_get_cpu_mic_tm_regs(policy->cpu)) {
>  		pr_info("invalid CBE regs pointers for cpufreq\n");
> +		of_node_put(cpu);
>  		return -EINVAL;
>  	}

I have taken another look at the implementation of this function.
I find that the second statement “return -EINVAL” would need related
source code adjustments.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/cpufreq/ppc_cbe_cpufreq.c?id=05d08e2995cbe6efdb993482ee0d38a77040861a#n96

How do you think about to complete the exception handling here?

Regards,
Markus
