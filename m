From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Apr 2019 12:54:25 +0000
Subject: Re: [1/7] cpufreq: ap806: Checking implementation ofarmada_8k_cpufreq_init()
Message-Id: <e018cf81-39ef-e052-56cc-98ca0eae8a2e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201904031408372646841@zte.com.cn>
In-Reply-To: <201904031408372646841@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, Gregory Clement <gregory.clement@bootlin.com>, Viresh Kumar <viresh.kumar@linaro.org>, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/cpufreq/armada-8k-cpufreq.c?id=05d08e2995cbe6efdb993482ee0d38a77040861a#n137
>
> Thank you for your comments.
> Adding a null pointer check here is indeed safer.

I wonder then why such a return value check was omitted so far.


> However, the purpose of series of patches is to add missing of_node_put
> to avoid memory leaks.

A few lines might become also more interesting besides these source code places.


> So after that, we will also add a null pointer check later.

Would we like to develop another script for the semantic patch language
to detect similarly questionable implementation details?

Regards,
Markus
