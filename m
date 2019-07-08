From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jul 2019 17:45:19 +0000
Subject: Re: [PATCH v3] cpufreq/pasemi: fix an use-after-free in pas_cpufreq_cpu_init()
Message-Id: <1af4a5c6-b0f1-5ea1-d311-951dc80455f1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1562575726-17438-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1562575726-17438-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Cheng Shengyu <cheng.shengyu@zte.com.cn>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Xue Zhihong <xue.zhihong@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> @@ -204,6 +205,7 @@  static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)

>  out_unmap_sdcasr:

>  	iounmap(sdcasr_mapbase);

>  out:

> +	of_node_put(cpu);


I would find the usage of a jump label like “put_node” nicer at such
a source code place.

Regards,
Markus
