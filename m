From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Tue, 21 Jan 2020 11:15:54 +0000
Subject: Re: Re: [PATCH 1/2] cmd64x: potential buffer overflow in cmd64x_program_timings()
Message-Id: <faf4b367-29b3-474c-73bc-400f6ab36758@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
        <20200120.144042.1810086369376110530.davem@davemloft.net>
        <CGME20200121111555eucas1p2d26b5230ab428f40ee3fc76d687e601f@eucas1p2.samsung.com>
In-Reply-To: <20200120.144042.1810086369376110530.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, dan.carpenter@oracle.com
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org


Hi,

On 1/20/20 2:40 PM, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Tue, 7 Jan 2020 16:04:41 +0300
> 
>> The "drive->dn" value is a u8 and it is controlled by root only, but
>> it could be out of bounds here so let's check.

drive->dn should not be root controllable, please point me where it
happens as this may need fixing instead of cmd64x driver.

[ IDE core makes sure that drive->dn is never > 3 and a lot of code
  assumes it. ]

>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied. 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
