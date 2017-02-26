From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Feb 2017 19:39:54 +0000
Subject: Re: [PATCH v2] drm/msm/dsi: Fix the releasing of resources in error path in 'dsi_bus_clk_enable()'
Message-Id: <3e77a9f8-521f-7e81-a9a9-51e046acf049@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170226121057.9717-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170226121057.9717-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Le 26/02/2017 à 16:25, Rob Clark a écrit :
> On Sun, Feb 26, 2017 at 7:10 AM, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>> If a 'clk_prepare_enable()' fails, then we need to disable_unprepare the
>> clk already handled.
>>
>> With the current implemenatation, we try to do that on the clk that has
>> triggered the error, which is a no-op and leave msm_host->bus_clks[0]
>> untouched.
>>
>> Count forward in order to fix it and be more future proof.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> v2: change the for loop from a backward to a forward one, to ease reading.
> fwiw, I prefer your v1, for reasons discussed on a similar patch
> fixing the same issue:
>
> https://lists.freedesktop.org/archives/dri-devel/2017-February/133097.html
>
> (although your v1 is a better solution than the original, since we
> probably don't want to clk_disable_unprepare() the clk that failed to
> enable.)
>
> BR,
> -R
Argh, 2 times in the same week that I post something already proposed by 
Dan.
Sorry for the noise. I should be more careful.

Thanks for the link and for explanation.

Best regards,
CJ

