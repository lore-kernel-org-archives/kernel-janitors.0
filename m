From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Apr 2019 10:43:14 +0000
Subject: Re: [PATCH 7/7] cpufreq: ppc_cbe: fix possible object reference leak
Message-Id: <efe8fb3a-eb4a-a50a-c53a-0879a912fbd8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554082674-2049-8-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1554082674-2049-8-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Yi Wang <wang.yi59@zte.com.cn>

> The call to of_get_cpu_node returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.

I would prefer a wording like the following.

A reference counter was incremented for a CPU node by a call of
the function “of_get_cpu_node”.
Thus decrement it after the last usage.


> Detected by coccinelle with the following warnings:

I wonder about the shown duplicate notification.
Can a single message be sufficient for the code search result
in this source file?

Regards,
Markus
