From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 28 Jun 2019 08:32:37 +0000
Subject: Re: [PATCH] net: stmmac: add sanity check to device_property_read_u32_array call
Message-Id: <26646ff1-059f-fb2d-e05d-43009aeb2150@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617165836.4673-1-colin.king@canonical.com>
 <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
 <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
 <CAFBinCDmYVPDMcwAAYhMfxxuTsG=xunduN58_8e20zE_Mhmb7Q@mail.gmail.com>
 <CAFBinCC-LLpfXQRFcKBbUpCfKc0S9Xtt60QrhEThsOFV-T7vFw@mail.gmail.com>
 <c46d2d17-c35b-46f0-0674-0c55bea3a272@canonical.com>
 <CAFBinCBk5aPVE+vq5px3QKS1T_R=WGXXxEJMC9X676KGvi9jdg@mail.gmail.com>
In-Reply-To: <CAFBinCBk5aPVE+vq5px3QKS1T_R=WGXXxEJMC9X676KGvi9jdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org

On 28/06/2019 05:15, Martin Blumenstingl wrote:
> On Tue, Jun 25, 2019 at 9:58 AM Colin Ian King <colin.king@canonical.com> wrote:
>>
>> On 25/06/2019 05:44, Martin Blumenstingl wrote:
>>> Hi Colin,
>>>
>>> On Thu, Jun 20, 2019 at 3:34 AM Martin Blumenstingl
>>> <martin.blumenstingl@googlemail.com> wrote:
>>>>
>>>> Hi Colin,
>>>>
>>>> On Wed, Jun 19, 2019 at 8:55 AM Colin Ian King <colin.king@canonical.com> wrote:
>>>>>
>>>>> On 19/06/2019 06:13, Martin Blumenstingl wrote:
>>>>>> Hi Colin,
>>>>>>
>>>>>>> Currently the call to device_property_read_u32_array is not error checked
>>>>>>> leading to potential garbage values in the delays array that are then used
>>>>>>> in msleep delays.  Add a sanity check to the property fetching.
>>>>>>>
>>>>>>> Addresses-Coverity: ("Uninitialized scalar variable")
>>>>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>>>> I have also sent a patch [0] to fix initialize the array.
>>>>>> can you please look at my patch so we can work out which one to use?
>>>>>>
>>>>>> my concern is that the "snps,reset-delays-us" property is optional,
>>>>>> the current dt-bindings documentation states that it's a required
>>>>>> property. in reality it isn't, there are boards (two examples are
>>>>>> mentioned in my patch: [0]) without it.
>>>>>>
>>>>>> so I believe that the resulting behavior has to be:
>>>>>> 1. don't delay if this property is missing (instead of delaying for
>>>>>>    <garbage value> ms)
>>>>>> 2. don't error out if this property is missing
>>>>>>
>>>>>> your patch covers #1, can you please check whether #2 is also covered?
>>>>>> I tested case #2 when submitting my patch and it worked fine (even
>>>>>> though I could not reproduce the garbage values which are being read
>>>>>> on some boards)
>>> in the meantime I have tested your patch.
>>> when I don't set the "snps,reset-delays-us" property then I get the
>>> following error:
>>>   invalid property snps,reset-delays-us
>>>
>>> my patch has landed in the meantime: [0]
>>> how should we proceed with your patch?

Your fix is good, so I think we should just drop/forget about my fix.

Colin

>>
>> I'm out of the office today. I'll get back to you on this tomorrow.
> gentle ping
> (I will be away for the weekend but I can reply on Monday)
> 
