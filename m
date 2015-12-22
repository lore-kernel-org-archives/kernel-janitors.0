From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 22 Dec 2015 05:47:43 +0000
Subject: Re: [PATCH 2/2] blackfin-cpufreq: Mark cpu_set_cclk() as static
Message-Id: <20151222053543.GB12364@ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5674598B.6020000@users.sourceforge.net>
 <56786EF3.3070203@users.sourceforge.net>
 <56786FF6.4060900@users.sourceforge.net>
In-Reply-To: <56786FF6.4060900@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On 21-12-15, 22:32, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 21 Dec 2015 22:12:26 +0100
> 
> The cpu_set_cclk() function was only used in a single source file so far.
> Indicate this setting also by the corresponding linkage specifier.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Well, I never Acked this patch as such and you shouldn't have
mentioned it by yourself. But it looks fine otherwise and so

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
