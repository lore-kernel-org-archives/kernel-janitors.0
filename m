From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 20 Apr 2018 04:36:23 +0000
Subject: Re: [greybus-dev] [PATCH 47/61] staging: greybus: simplify getting .drvdata
Message-Id: <20180420042423.GI24576@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-48-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-48-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, kernel-janitors@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, linux-renesas-soc@vger.kernel.org

On 19-04-18, 16:06, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/staging/greybus/arche-platform.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
