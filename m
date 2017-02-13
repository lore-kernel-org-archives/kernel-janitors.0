From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 13 Feb 2017 16:44:06 +0000
Subject: Re: [PATCH] usb: misc: usbtest: remove redundant check on retval < 0
Message-Id: <ffc33c9f-191a-d19c-8aaa-b18519dd25af@canonical.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bkoXteOGwgJs5HKmJ32LxMGr0lA92AF9V"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170212183518.22528-1-colin.king@canonical.com>
 <8760keqshs.fsf@linux.intel.com>
In-Reply-To: <8760keqshs.fsf@linux.intel.com>
To: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>, Lu Baolu <baolu.lu@linux.intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bkoXteOGwgJs5HKmJ32LxMGr0lA92AF9V
Content-Type: multipart/mixed; boundary="PoVnRfRxfUpuWW3KJVcSnf3lpcR7QBDrF";
 protected-headers="v1"
From: Colin Ian King <colin.king@canonical.com>
To: Felipe Balbi <felipe.balbi@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <ffc33c9f-191a-d19c-8aaa-b18519dd25af@canonical.com>
Subject: Re: [PATCH] usb: misc: usbtest: remove redundant check on retval < 0
References: <20170212183518.22528-1-colin.king@canonical.com>
 <8760keqshs.fsf@linux.intel.com>
In-Reply-To: <8760keqshs.fsf@linux.intel.com>

--PoVnRfRxfUpuWW3KJVcSnf3lpcR7QBDrF
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 13/02/17 10:45, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Colin King <colin.king@canonical.com> writes:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check for retval being less than zero is always true since
>> retval equal to -EPIPE at that point.  Replace the existing
>> conditional with just return retval.
>>
>> Detected with CoverityScan, CID#114349 ("Logically dead code")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/usb/misc/usbtest.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
>> index 3525626..17c0810 100644
>> --- a/drivers/usb/misc/usbtest.c
>> +++ b/drivers/usb/misc/usbtest.c
>> @@ -992,7 +992,7 @@ static int ch9_postconfig(struct usbtest_dev *dev)=

>>  				dev_err(&iface->dev,
>>  						"hs dev qualifier --> %d\n",
>>  						retval);
>> -				return (retval < 0) ? retval : -EDOM;
>> +				return retval;
>=20
> you're changing return value here, are you sure there's nothing else
> depending on this error?
>=20
The code in the current state will never return -EDOM and will always
return retval, so this change actually makes no functional change, it
just removes a redundant check.  So it's not going to make a jot of
difference to the current behaver.


--PoVnRfRxfUpuWW3KJVcSnf3lpcR7QBDrF--

--bkoXteOGwgJs5HKmJ32LxMGr0lA92AF9V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI2BAEBCAAgBQJYoeJXGRxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20ACgkQaMKH
38aoAibzmRAAlB5CxhqomTdQ6YBexbLfOG2mpHOp6sMHFaN86MpWSAjLXjLP6wM4
/3Qc4bIiOWXPEhzLTg+MDaU/PfklTfperoH3CzPL5dNbcRZZj6bbHI4qhVSoVVNa
UJvAdEVGkAWWFfTBg1/uBZUwDvQ7yG8KKHrATEweClOmJeLT4UY5Nn/1iKcjxsXC
hpa4vBebuEqJ0J03NDzfEWVLsoRlp/e0/o8lhQZ9bEspTM96/2ZYZ7X93i6abtki
/CUi29dK1teeSDWK4RM/JP9xlDvgcrAa1TvjiA8KGSCVAbCvMFkABxGDQjcNcOZu
xm2BJOc0ZFrwiOt8hKlvwr9497+w6PHw2uT6FetvE4ecKosW2aN2lrz+ARUtjTfR
0esI0HiXr2+JDi1U2zu4evWhVf6SnFT5E15NsmByAmMUhThUHbJiml86UHaU+qgC
ddgZjI3sq+x/7GW3Z7xnsrDA5CZIy0zaI9gltCo2PDDDaNShordbt4Gk5BfbecVj
YBfhunFZOuqi97hcS0bzC3YP0ClY/6aSBIP0gh/qYd1VqYBqObRQjZL2HzYpXw1Q
ihfKA7vkQ3cvbk7CJW4cxPdMjquQAqY6GhGxKM4ncHXNerzgiHnlxuu6v2Lzud5p
d+5xYU8p/+OTOrgPPvQ4T2wT9WVVl6EeDgLVXEc/ml7EpiZLHcw+Qvc=
=9r5M
-----END PGP SIGNATURE-----

--bkoXteOGwgJs5HKmJ32LxMGr0lA92AF9V--
