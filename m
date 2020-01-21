From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Tue, 21 Jan 2020 12:38:16 +0000
Subject: Re: [PATCH 1/2] cmd64x: potential buffer overflow in cmd64x_program_timings()
Message-Id: <89d856ef-7c00-a2b7-bfcc-483c78092d20@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
        <20200120.144042.1810086369376110530.davem@davemloft.net>
        <CGME20200121111555eucas1p2d26b5230ab428f40ee3fc76d687e601f@eucas1p2.samsung.com>
        <faf4b367-29b3-474c-73bc-400f6ab36758@samsung.com>
        <20200121114835.GB1847@kadam>
        <02ea0fe7-fedd-66ac-ac60-0cdcb8802076@samsung.com>
In-Reply-To: <02ea0fe7-fedd-66ac-ac60-0cdcb8802076@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Miller <davem@davemloft.net>, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org


On 1/21/20 1:21 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> On 1/21/20 12:48 PM, Dan Carpenter wrote:
>> On Tue, Jan 21, 2020 at 12:15:54PM +0100, Bartlomiej Zolnierkiewicz wrote:
>>>
>>> Hi,
>>>
>>> On 1/20/20 2:40 PM, David Miller wrote:
>>>> From: Dan Carpenter <dan.carpenter@oracle.com>
>>>> Date: Tue, 7 Jan 2020 16:04:41 +0300
>>>>
>>>>> The "drive->dn" value is a u8 and it is controlled by root only, but
>>>>> it could be out of bounds here so let's check.
>>>
>>> drive->dn should not be root controllable, please point me where it
>>> happens as this may need fixing instead of cmd64x driver.
>>>
>>> [ IDE core makes sure that drive->dn is never > 3 and a lot of code
>>>   assumes it. ]
>>>
>>
>> It's a marked as a setable field in ide-proc.c
>>
>> drivers/ide/ide-proc.c
>>    206  ide_devset_rw(current_speed, xfer_rate);
>>    207  ide_devset_rw_field(init_speed, init_speed);
>>    208  ide_devset_rw_flag(nice1, IDE_DFLAG_NICE1);
>>    209  ide_devset_rw_field(number, dn);
>>                             ^^^^^^^^^^
>> Sets ->dn
> 
> It is a bug.

PS The rationale for fixing it is:

- IDE core always sets ->dn correctly (changing it is never required)

- setting different value than assigned by IDE core is very likely to
  result in data corruption (due to wrong transfer timings being set on
  the controller etc.)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
