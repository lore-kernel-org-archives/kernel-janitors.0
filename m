From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 21 Dec 2020 23:00:19 +0000
Subject: Re: [PATCH] cpufreq: brcmstb-avs-cpufreq: Fix some resource leaks in the error handling path of the 
Message-Id: <1cba966a-2485-3333-40fd-26ffa1c3d78f@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mmayer@broadcom.com, bcm-kernel-feedback-list@broadcom.com, rjw@rjwysocki.net, viresh.kumar@linaro.org, f.fainelli@gmail.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org



On 12/19/2020 2:17 AM, Christophe JAILLET wrote:
> If 'cpufreq_register_driver()' fails, we must release the resources
> allocated in 'brcm_avs_prepare_init()' as already done in the remove
> function.
> 
> To do that, introduce a new function 'brcm_avs_prepare_uninit()' in order
> to avoid code duplication. This also makes the code more readable (IMHO).
> 
> Fixes: de322e085995 ("cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

We could have considered switching to device managed APIs for automatic
cleanup, but this will do as well. Thanks Christophe.
--
Florian
