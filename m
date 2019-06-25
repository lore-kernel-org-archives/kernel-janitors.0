From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 25 Jun 2019 07:58:10 +0000
Subject: Re: [PATCH] net: stmmac: add sanity check to device_property_read_u32_array call
Message-Id: <c46d2d17-c35b-46f0-0674-0c55bea3a272@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617165836.4673-1-colin.king@canonical.com>
 <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
 <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
 <CAFBinCDmYVPDMcwAAYhMfxxuTsG=xunduN58_8e20zE_Mhmb7Q@mail.gmail.com>
 <CAFBinCC-LLpfXQRFcKBbUpCfKc0S9Xtt60QrhEThsOFV-T7vFw@mail.gmail.com>
In-Reply-To: <CAFBinCC-LLpfXQRFcKBbUpCfKc0S9Xtt60QrhEThsOFV-T7vFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org

On 25/06/2019 05:44, Martin Blumenstingl wrote:
> Hi Colin,
>=20
> On Thu, Jun 20, 2019 at 3:34 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> Hi Colin,
>>
>> On Wed, Jun 19, 2019 at 8:55 AM Colin Ian King <colin.king@canonical.com=
> wrote:
>>>
>>> On 19/06/2019 06:13, Martin Blumenstingl wrote:
>>>> Hi Colin,
>>>>
>>>>> Currently the call to device_property_read_u32_array is not error che=
cked
>>>>> leading to potential garbage values in the delays array that are then=
 used
>>>>> in msleep delays.  Add a sanity check to the property fetching.
>>>>>
>>>>> Addresses-Coverity: ("Uninitialized scalar variable")
>>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> I have also sent a patch [0] to fix initialize the array.
>>>> can you please look at my patch so we can work out which one to use?
>>>>
>>>> my concern is that the "snps,reset-delays-us" property is optional,
>>>> the current dt-bindings documentation states that it's a required
>>>> property. in reality it isn't, there are boards (two examples are
>>>> mentioned in my patch: [0]) without it.
>>>>
>>>> so I believe that the resulting behavior has to be:
>>>> 1. don't delay if this property is missing (instead of delaying for
>>>>    <garbage value> ms)
>>>> 2. don't error out if this property is missing
>>>>
>>>> your patch covers #1, can you please check whether #2 is also covered?
>>>> I tested case #2 when submitting my patch and it worked fine (even
>>>> though I could not reproduce the garbage values which are being read
>>>> on some boards)
> in the meantime I have tested your patch.
> when I don't set the "snps,reset-delays-us" property then I get the
> following error:
>   invalid property snps,reset-delays-us
>=20
> my patch has landed in the meantime: [0]
> how should we proceed with your patch?

I'm out of the office today. I'll get back to you on this tomorrow.

Colin
>=20
>=20
> Martin
>=20
>=20
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/co=
mmit/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c?id=84ce4d0f9f55b4f4c=
a4d4edcbb54a23d9dad1aae
>=20
