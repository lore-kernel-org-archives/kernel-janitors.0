From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Apr 2019 14:23:54 +0000
Subject: Re: [5/7] cpufreq/pasemi: Checking implementation of pas_cpufreq_cpu_init()
Message-Id: <c0c9c429-a09f-41ba-611d-123b64e410c8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554082674-2049-6-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1554082674-2049-6-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Yi Wang <wang.yi59@zte.com.cn>

> @@ -146,6 +146,7 @@  static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>
>  	cpu = of_get_cpu_node(policy->cpu, NULL);
>
> +	of_node_put(cpu);
>  	if (!cpu)
>  		goto out;

Can the statement “return -ENODEV” be nicer as exception handling
in the if branch of this source code place?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/cpufreq/pasemi-cpufreq.c?id=bf97b82f37c6d90e16de001d0659644c57fa490d#n137

Regards,
Markus
