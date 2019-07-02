From: Keerthy <j-keerthy@ti.com>
Date: Tue, 02 Jul 2019 11:48:59 +0000
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch statement
Message-Id: <0c0e0e49-48c3-c1af-b7c7-26603d98cfe3@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627131639.6394-1-colin.king@canonical.com>
 <20190628143628.GJ5379@sirena.org.uk>
 <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
 <20190702104420.GD4652@dell>
 <4a0a50be-1465-0554-f787-dec72bc07a00@canonical.com>
 <20190702113157.GG4652@dell>
In-Reply-To: <20190702113157.GG4652@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Colin Ian King <colin.king@canonical.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 02/07/19 5:01 PM, Lee Jones wrote:
> On Tue, 02 Jul 2019, Colin Ian King wrote:
> 
>> On 02/07/2019 11:44, Lee Jones wrote:
>>> On Fri, 28 Jun 2019, Colin Ian King wrote:
>>>
>>>> On 28/06/2019 15:36, Mark Brown wrote:
>>>>> On Thu, Jun 27, 2019 at 02:16:39PM +0100, Colin King wrote:
>>>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>>>
>>>>>> Currently the LP87565_DEVICE_TYPE_LP87561_Q1 case does not have a
>>>>>> break statement, causing it to fall through to a dev_err message.
>>>>>> Fix this by adding in the missing break statement.
>>>>>
>>>>> This doesn't apply against current code, please check and resend.
>>>>>
>>>> So it applies cleanly against linux-next, I think the original code
>>>> landed in mfd/for-mfd-next - c.f. https://lkml.org/lkml/2019/5/28/550
>>>
>>> Applied, thanks Colin.
>>>
>> I'm confused, who is the official maintainer of the regulator patches
>> nowadays?
> 
> Mark.  But the patch you're fixing is currently in the MFD tree.
> 
> I sent him an updated pull-request.

Thanks Lee!

> 
> Don't worry mate, you're in good hands. ;)
> 
