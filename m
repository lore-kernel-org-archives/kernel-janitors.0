From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 07 Feb 2017 20:29:36 +0000
Subject: Re: [patch] cpufreq: s3c2416: double free on driver init error path
Message-Id: <20170207202936.pc6uyk6jsghxdyzi@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131906.GD27416@mwanda>
In-Reply-To: <20170207131906.GD27416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kukjin Kim <kgene@kernel.org>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 07, 2017 at 04:19:06PM +0300, Dan Carpenter wrote:
> The "goto err_armclk;" error path already does a clk_put(s3c_freq->hclk);
> so this is a double free.
> 
> Fixes: 34ee55075265 ("[CPUFREQ] Add S3C2416/S3C2450 cpufreq driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

