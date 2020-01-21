From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Tue, 21 Jan 2020 11:18:14 +0000
Subject: Re: Re: [PATCH 2/2] ide: serverworks: potential overflow in svwks_set_pio_mode()
Message-Id: <6c4a2070-043f-d26c-69dc-0a294d5f6768@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
        <20200107130607.tv3uosduwkw3yka6@kili.mountain>
        <20200120.144047.202754056310659523.davem@davemloft.net>
        <CGME20200121111816eucas1p246ca07e30a984c51d8281a161978d3ea@eucas1p2.samsung.com>
In-Reply-To: <20200120.144047.202754056310659523.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, dan.carpenter@oracle.com
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org


On 1/20/20 2:40 PM, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Tue, 7 Jan 2020 16:06:07 +0300
> 
>> The "drive->dn" variable is a u8 controlled by root.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

drive->dn should not be root controllable, please point me where it
happens as this may need fixing instead of serverworks driver.

[ IDE core makes sure that drive->dn is never > 3 and a lot of code
  assumes it. ]

> Applied.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
