From: walter harms <wharms@bfs.de>
Date: Sat, 30 Jul 2011 08:42:29 +0000
Subject: Re: [patch] w1: off by one in w1_f29_remove_slave()
Message-Id: <4E33C3F5.9000602@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727095557.GL3824@shale.localdomain> <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com>
In-Reply-To: <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Jean-Fran=E7ois_Dagenais?= <jeff.dagenais@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



Am 29.07.2011 22:28, schrieb Jean-Fran=E7ois Dagenais:
> Yup, confirmed, weird that I did not notice a crash, probably lucky shot =
in the environment I was using it.
>=20
> On 2011-07-27, at 05:55, Dan Carpenter wrote:
>=20
>> This reads past the end of the w1_f29_sysfs_bin_files[] array.  I
>> don't have this hardware, but I assume it crashes every time the
>> function is called.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Acked-by: Jean-Fran=E7ois Dagenais <dagenaisj@sonatest.com>
>>
>> diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408=
.c
>> index c377818..0da4e97 100644
>> --- a/drivers/w1/slaves/w1_ds2408.c
>> +++ b/drivers/w1/slaves/w1_ds2408.c
>> @@ -373,7 +373,7 @@ static int w1_f29_add_slave(struct w1_slave *sl)
>> static void w1_f29_remove_slave(struct w1_slave *sl)
>> {
>> 	int i;
>> -	for (i =3D NB_SYSFS_BIN_FILES; i <=3D 0; --i)
>> +	for (i =3D NB_SYSFS_BIN_FILES - 1; i <=3D 0; --i)
>> 		sysfs_remove_bin_file(&sl->dev.kobj,
>> 			&(w1_f29_sysfs_bin_files[i]));
>> }


Is there any reason to release the data "backwards" ?
The default way is to go upwards. that looks more readable.

for (i=3D0; i < NB_SYSFS_BIN_FILES ; i++)
  sysfs_remove_bin_file(&sl->dev.kobj, w1_f29_sysfs_bin_files+i);

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
