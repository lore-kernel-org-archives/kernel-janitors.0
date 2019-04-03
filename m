From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Apr 2019 13:50:44 +0000
Subject: Re: [4/7] cpufreq: maple: Checking implementation of maple_cpufreq_init()
Message-Id: <5d0e8f12-baaa-e4af-f1d2-03e0508e3fd1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554082674-2049-5-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1554082674-2049-5-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Yi Wang <wang.yi59@zte.com.cn>

> @@ -210,7 +210,7 @@  static int __init maple_cpufreq_init(void)
>  	 */
>  	valp = of_get_property(cpunode, "clock-frequency", NULL);
>  	if (!valp)
> -		return -ENODEV;
> +		goto bail_noprops;
>  	max_freq = (*valp)/1000;
>  	maple_cpu_freqs[0].frequency = max_freq;
>  	maple_cpu_freqs[1].frequency = max_freq/2;

* How do you think about use the jump label “put_node” instead?

* Would you like to reduce a bit of duplicate source code at the end
  of this function?
  https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/cpufreq/maple-cpufreq.c?id=bf97b82f37c6d90e16de001d0659644c57fa490d#n232

Regards,
Markus
