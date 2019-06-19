From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 19 Jun 2019 06:55:28 +0000
Subject: Re: [PATCH] net: stmmac: add sanity check to device_property_read_u32_array call
Message-Id: <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617165836.4673-1-colin.king@canonical.com>
 <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org

On 19/06/2019 06:13, Martin Blumenstingl wrote:
> Hi Colin,
> 
>> Currently the call to device_property_read_u32_array is not error checked
>> leading to potential garbage values in the delays array that are then used
>> in msleep delays.  Add a sanity check to the property fetching.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> I have also sent a patch [0] to fix initialize the array.
> can you please look at my patch so we can work out which one to use?
> 
> my concern is that the "snps,reset-delays-us" property is optional,
> the current dt-bindings documentation states that it's a required
> property. in reality it isn't, there are boards (two examples are
> mentioned in my patch: [0]) without it.
> 
> so I believe that the resulting behavior has to be:
> 1. don't delay if this property is missing (instead of delaying for
>    <garbage value> ms)
> 2. don't error out if this property is missing
> 
> your patch covers #1, can you please check whether #2 is also covered?
> I tested case #2 when submitting my patch and it worked fine (even
> though I could not reproduce the garbage values which are being read
> on some boards)
> 
> 
> Thank you!
> Martin
> 
> 
> [0] https://lkml.org/lkml/2019/4/19/638
> 
Is that the correct link?

Colin
