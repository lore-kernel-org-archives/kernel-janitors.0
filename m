From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 21 Sep 2020 21:03:33 +0000
Subject: Re: [PATCH][next] PCI: brcmstb: fix a missing if statement on a return error check
Message-Id: <2702aa0d-7f60-05c1-7b9b-cfe313024886@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200921144017.334602-1-colin.king@canonical.com>
 <c9d7435b-42a1-2e40-7d40-62d227523f79@gmail.com>
 <CA+-6iNyg16dEfnJZpSppRHO6Z6fsWyQdjyzoVsBRW4W1x_4Yeg@mail.gmail.com>
In-Reply-To: <CA+-6iNyg16dEfnJZpSppRHO6Z6fsWyQdjyzoVsBRW4W1x_4Yeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Quinlan <james.quinlan@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Jim Quinlan <jquinlan@broadcom.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

On 21/09/2020 21:53, Jim Quinlan wrote:
> Hello,
> I am fine with Colin's suggested change or Florians as well:
> 
>          ret = brcm_phy_start(pcie);
> +        if (ret) {
> +                clk_disable_unprepare(pcie->clk);
>                  return ret;
> +        }
> 
> Currently, our STB upstream suspend/resume is not functional yet and
> this is how this omission slipped by testing.
> 
> Thanks,
> Jim Quinlan
> Broadcom STB
> 
> On Mon, Sep 21, 2020 at 3:43 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 9/21/20 7:40 AM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The error return ret is not being check with an if statement and
>>> currently the code always returns leaving the following code as
>>> dead code. Fix this by adding in the missing if statement.
>>>
>>> Addresses-Coverity: ("Structurally dead code")
>>> Fixes: ad3d29c77e1e ("PCI: brcmstb: Add control of rescal reset")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  drivers/pci/controller/pcie-brcmstb.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
>>> index 7a3ff4632e7c..cb0c11b7308e 100644
>>> --- a/drivers/pci/controller/pcie-brcmstb.c
>>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>>> @@ -1154,6 +1154,7 @@ static int brcm_pcie_resume(struct device *dev)
>>>       clk_prepare_enable(pcie->clk);
>>>
>>>       ret = brcm_phy_start(pcie);
>>> +     if (ret)
>>>               return ret;
>>
>> Maybe this should also disable the clock if we failed to start the PHY
>> somehow.
> 
> Hi Florian,
> 
> I'm fine with Colin's change as
> 

I'll send a V2 in a short while
> 
>>
>> --
>> Florian
