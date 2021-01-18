From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 18 Jan 2021 06:55:36 +0000
Subject: Re: [PATCH v2 1/2] cpufreq: brcmstb-avs-cpufreq: Fix some resource leaks in the error handling path 
Message-Id: <20210118065421.x5s54evpafq73ouk@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210117142635.568686-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210117142635.568686-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: f.fainelli@gmail.com, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, mmayer@broadcom.com, linux-arm-kernel@lists.infradead.org

On 17-01-21, 15:26, Christophe JAILLET wrote:
> If 'cpufreq_register_driver()' fails, we must release the resources
> allocated in 'brcm_avs_prepare_init()' as already done in the remove
> function.
> 
> To do that, introduce a new function 'brcm_avs_prepare_uninit()' in order
> to avoid code duplication. This also makes the code more readable (IMHO).
> 
> Fixes: de322e085995 ("cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v1->v2: be less verbose when writing the error handling path of the probe
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)

Applied both patches. Thanks.

-- 
viresh
