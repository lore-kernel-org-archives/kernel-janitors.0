From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 22 Sep 2020 12:50:12 +0000
Subject: Re: [PATCH v2] PCI: brcmstb: fix a missing if statement on a return error check
Message-Id: <22b12b8a-4c16-5377-043d-00750597f822@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fe38fa7c-8ff7-8e83-968f-91007c058fcc@web.de>
 <CA+-6iNyGbL2jn1qUdX=AN17Xy5uX1-P=+Xi2NLSxHX-1FwLOwg@mail.gmail.com>
In-Reply-To: <CA+-6iNyGbL2jn1qUdX=AN17Xy5uX1-P=+Xi2NLSxHX-1FwLOwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jim Quinlan <james.quinlan@broadcom.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Jim Quinlan <jquinlan@broadcom.com>, Alex Dewar <alex.dewar90@gmail.com>, "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>

On 22/09/2020 13:43, Jim Quinlan wrote:
> On Tue, Sep 22, 2020 at 7:49 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>>
>>> The error return ret is not being check with an if statement and
>>
>> Wording alternative:
>> The return value from a call of the function “brcm_phy_start” was not checked and
>>
>>
>>> V2: disable clock as noted by Florian Fainelli and suggested by
>>>     Jim Quinlan.
>>
>> Alex Dewar contributed another update suggestion.
>>
>> [PATCH v2] PCI: brcmstb: Add missing if statement and error path
>> https://lore.kernel.org/linux-arm-kernel/20200921211623.33908-1-alex.dewar90@gmail.com/
>> https://lore.kernel.org/patchwork/patch/1309860/
>>
>> The exception handling needs further development considerations
>> for this function implementation.
> Hello,
> 
> I agree with Alex's patch.  I should have suggested this at the
> beginning but as our upstream STB suspend/resume is not yet functional
> and the one-line change would have worked until we fixed
> suspend/resume..  But this is the proper modification.

Yup, go with Alex's patch. That one is correct.


> 
> Thanks,
> Jim
>> Regards,
>> Markus
