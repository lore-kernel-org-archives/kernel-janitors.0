From: Jonathan Cameron <jic23@kernel.org>
Date: Mon, 27 Aug 2012 20:09:08 +0000
Subject: Re: [PATCH 1/13] drivers/staging/iio/adc/spear_adc.c: use clk_prepare_enable and clk_disable_unprepa
Message-Id: <503BD3E4.4080300@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr> <1345996865-32082-2-git-send-email-Julia.Lawall@lip6.fr> <CAOh2x=mRDLO0fXcZgQ1pa3bAiBksC87cVTniTO_Qz9Ou++OMGg@mail.gmail.com> <503BD353.3070203@kernel.org>
In-Reply-To: <503BD353.3070203@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viresh kumar <viresh.kumar@linaro.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Stefan Roese <sr@denx.de>, Shiraz HASHIM <shiraz.hashim@st.com>, Jonathan Cameron <jic23@cam.ac.uk>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, spear-devel <spear-devel@list.st.com>

On 08/27/2012 09:06 PM, Jonathan Cameron wrote:
> On 08/27/2012 05:01 AM, viresh kumar wrote:
>> On Sun, Aug 26, 2012 at 9:30 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>>
>>> Clk_prepare_enable and clk_disable_unprepare combine clk_prepare and
>>> clk_enable, and clk_disable and clk_unprepare.  They make the code more
>>> concise, and ensure that clk_unprepare is called when clk_enable fails.
>>>
>>> A simplified version of the semantic patch that introduces calls to these
>>> functions is as follows: (http://coccinelle.lip6.fr/)
>>
>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> merged to fixes-togreg branch of kernel.org iio.git will push onwards in a few
> days...
sorry, wrong branch as clearly just a cleanup not a fix. Will be in togreg
branch instead.
>>
>> @Stefan/Shiraz: Can you update spear-devel mailing list in MAINTAINERS file
>> for this driver?
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
