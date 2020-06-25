From: Stephen Boyd <swboyd@chromium.org>
Date: Thu, 25 Jun 2020 06:59:41 +0000
Subject: Re: [PATCH] kernel/cpu_pm: mark 1 function as __init to save some memory
Message-Id: <159306838110.62212.10303992077632246358@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200621083315.883209-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200621083315.883209-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, bjorn.andersson@linaro.org, dianders@chromium.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Christophe JAILLET (2020-06-21 01:33:15)
> 'cpu_pm_init()' is only called via 'core_initcall'.
> It can be marked as __init to save a few bytes of memory.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
