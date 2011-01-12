From: walter harms <wharms@bfs.de>
Date: Wed, 12 Jan 2011 15:49:01 +0000
Subject: Re: [patch v3] [media] av7110: check for negative array offset
Message-Id: <4D2DCD6D.8030900@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107194153.GA1959@bicker>
In-Reply-To: <20110107194153.GA1959@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



Am 12.01.2011 14:30, schrieb Jorge Merlino:
> El 12/01/11 10:44, walter harms escribi=F3:
>>> diff --git a/drivers/media/dvb/ttpci/av7110_ca.c b/drivers/media/dvb/tt=
pci/av7110_ca.c
>>> index 122c728..923a8e2 100644
>>> --- a/drivers/media/dvb/ttpci/av7110_ca.c
>>> +++ b/drivers/media/dvb/ttpci/av7110_ca.c
>>> @@ -277,7 +277,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned=
 int cmd, void *parg)
>>>  	{
>>>  		ca_slot_info_t *info=3D(ca_slot_info_t *)parg;
>>> =20
>>> -		if (info->num > 1)
>>> +		if (info->num < 0 || info->num > 1)
>>>  			return -EINVAL;
>>
>> maybe i miss the point but anything else than 0 will cause -EINVAL ?
>> Is that intended ?
>=20
> Anything else than 0 or 1.


mmmh, yes my bad,
ntl can the "1" be replaced with array_size(av7110->ci_slot)-1 ?

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
