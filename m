From: Timur Tabi <timur@codeaurora.org>
Date: Mon, 13 Feb 2017 16:23:24 +0000
Subject: Re: [patch net-next] net: qcom/emac: fix a sizeof() typo
Message-Id: <8d0a9360-4c7f-3729-6a1a-d881550f6763@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170213110021.GA17205@mwanda>
In-Reply-To: <20170213110021.GA17205@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ah yes, thet are two completely different network drivers, both called EMAC. 
IBM's EMAC controller is not related at all to Qualcomm's EMAC driver.  It's 
just an unfortunate coincidence that both devices are called EMAC, and that's 
why both drivers are also called EMAC.

walter harms wrote:
>
>
> Am 13.02.2017 16:43, schrieb Timur Tabi:
>> walter harms wrote:
>>> The question is: why is a simple calculation const*const
>>> separated into a function ?
>>
>> This is a callback function.  That's just how it's defined.
>>
>> It's rare, but there are drivers that use the parameter, like this one:
>>
>> http://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/tree/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c#n591
>>
>>
>
> this is the problem:
> I used: http://lxr.free-electrons.com/source/drivers/net/ibm_emac/ibm_emac_core.c?v=2.6.24#L1778
>
> here is the patched function emac_get_regs_len used the calculate the length in emac_ethtool_get_regs_len
> what is used as callback.
>
> in
> http://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/tree/drivers/net/ethernet/qualcomm/emac/emac-ethtool.c
> is it now used directly.
>
> sorry for the noise,
>
> re,
>  wh
>


-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
