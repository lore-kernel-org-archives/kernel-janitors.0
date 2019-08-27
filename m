From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 27 Aug 2019 07:58:27 +0000
Subject: Re: [PATCH] bcma: fix incorrect update of BCMA_CORE_PCI_MDIO_DATA
Message-Id: <a29bf743-f913-c129-8789-0091ec137491@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822133524.6274-1-colin.king@canonical.com>
 <d3c16158-ef89-f5ee-2f67-4357c70e8fe9@lwfinger.net>
 <31258833-174f-080b-489e-85d3556bd1de@canonical.com>
 <f1aa1f6f-d293-c2cd-d1fc-a6b10d49a1bb@lwfinger.net>
In-Reply-To: <f1aa1f6f-d293-c2cd-d1fc-a6b10d49a1bb@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/08/2019 17:38, Larry Finger wrote:
> On 8/22/19 11:11 AM, Colin Ian King wrote:
>> On 22/08/2019 17:03, Larry Finger wrote:
>>> On 8/22/19 8:35 AM, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> An earlier commit re-worked the setting of the bitmask and is now
>>>> assigning v with some bit flags rather than bitwise or-ing them
>>>> into v, consequently the earlier bit-settings of v are being lost.
>>>> Fix this by replacing an assignment with the bitwise or instead.
>>>>
>>>> Addresses-Coverity: ("Unused value")
>>>> Fixes: 2be25cac8402 ("bcma: add constants for PCI and use them")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>    drivers/bcma/driver_pci.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/bcma/driver_pci.c b/drivers/bcma/driver_pci.c
>>>> index f499a469e66d..d219ee947c07 100644
>>>> --- a/drivers/bcma/driver_pci.c
>>>> +++ b/drivers/bcma/driver_pci.c
>>>> @@ -78,7 +78,7 @@ static u16 bcma_pcie_mdio_read(struct bcma_drv_pci
>>>> *pc, u16 device, u8 address)
>>>>            v |= (address << BCMA_CORE_PCI_MDIODATA_REGADDR_SHF_OLD);
>>>>        }
>>>>    -    v = BCMA_CORE_PCI_MDIODATA_START;
>>>> +    v |= BCMA_CORE_PCI_MDIODATA_START;
>>>>        v |= BCMA_CORE_PCI_MDIODATA_READ;
>>>>        v |= BCMA_CORE_PCI_MDIODATA_TA;
>>>
>>> I'm not sure the "Fixes" attribute is correct.
>>>
>>> The changes for this section in commit 2be25cac8402 are
>>>
>>> -       v = (1 << 30); /* Start of Transaction */
>>> -       v |= (1 << 28); /* Write Transaction */
>>> -       v |= (1 << 17); /* Turnaround */
>>> -       v |= (0x1F << 18);
>>> +       v = BCMA_CORE_PCI_MDIODATA_START;
>>> +       v |= BCMA_CORE_PCI_MDIODATA_WRITE;
>>> +       v |= (BCMA_CORE_PCI_MDIODATA_DEV_ADDR <<
>>> +             BCMA_CORE_PCI_MDIODATA_DEVADDR_SHF);
>>> +       v |= (BCMA_CORE_PCI_MDIODATA_BLK_ADDR <<
>>> +             BCMA_CORE_PCI_MDIODATA_REGADDR_SHF);
>>> +       v |= BCMA_CORE_PCI_MDIODATA_TA;
>>>
>>> Because the code has done quite a bit of work on v just above this
>>> section, I agree that this is likely an error, but that error happened
>>> in an earlier commit. Thus 2be25cac8402 did not introduce the error,
>>> merely copied it.

I did a second look at Larry's comments above and realized the code he
is referring to is in bcma_pcie_mdio_set_phy which is OK

Instead, the code I'm fixing is in bcma_pcie_mdio_read, which was broken
by commit 2be25cac8402fab56bb51166f464d1b420bcf744

        if (pc->core->id.rev >= 10) {
                max_retries = 200;
                bcma_pcie_mdio_set_phy(pc, device);
+               v = (BCMA_CORE_PCI_MDIODATA_DEV_ADDR <<
+                    BCMA_CORE_PCI_MDIODATA_DEVADDR_SHF);
+               v |= (address << BCMA_CORE_PCI_MDIODATA_REGADDR_SHF);
+       } else {
+               v = (device << BCMA_CORE_PCI_MDIODATA_DEVADDR_SHF_OLD);
+               v |= (address << BCMA_CORE_PCI_MDIODATA_REGADDR_SHF_OLD);
        }

-       v = (1 << 30); /* Start of Transaction */
-       v |= (1 << 29); /* Read Transaction */
-       v |= (1 << 17); /* Turnaround */
-       if (pc->core->id.rev < 10)
-               v |= (u32)device << 22;
-       v |= (u32)address << 18;
-       pcicore_write32(pc, mdio_data, v);
+       v = BCMA_CORE_PCI_MDIODATA_START;
+       v |= BCMA_CORE_PCI_MDIODATA_READ;
+       v |= BCMA_CORE_PCI_MDIODATA_TA;
+
+       pcicore_write32(pc, BCMA_CORE_PCI_MDIO_DATA, v);


>>
>> Ugh, this goes back further. I didn't spot that. I'm less confident of
>> what the correct settings should be now.
>>
>>>
>>> Has this change been tested?
>>
>> Afraid not, I don't have the H/W.
> 
> I admit that I looked at this only because I found it hard to believe
> that the collective wisdom of the list would have missed the usage of
> "=" instead of "|=". At least that test was passed. :)

Maybe not after all :-)

> 
> Larry
> 

I'll send a V2 with the write fix, and the same fixes commit sha
