From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 03 Nov 2016 19:56:49 +0000
Subject: Re: [PATCH 3/3] [media] au0828-video: Move two assignments in au0828_init_isoc()
Message-Id: <65b399e5-8c18-45a4-643d-527dd3bbff3d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6a37822-c0f9-1f1e-6ebe-a1c88c6d9d0a@users.sourceforge.net>
 <1ab6b168-3c69-97c2-d02e-cd64b7fa222f@users.sourceforge.net>
 <4e6e77af-1b2c-33a6-1bc3-058ac5ecc038@xs4all.nl>
In-Reply-To: <4e6e77af-1b2c-33a6-1bc3-058ac5ecc038@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?Q?Rafael_Louren=c3=a7o_de_Lima_Chehab?= <chehabrafael@gmail.com>, Shuah Khan <shuah@kernel.org>, Wolfram Sang <wsa-dev@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Mon, 24 Oct 2016 22:44:02 +0200
>>
>> Move the assignment for the data structure members "isoc_copy"
>> and "num_bufs" behind the source code for memory allocations
>> by this function.
>=20
> I don't see the point,

Another explanation try =E2=80=A6


> dropping this patch.

I proposed that these assignments should only be performed after the requir=
ed
memory allocations succeeded. Is this detail worth for further consideratio=
ns?


>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>  drivers/media/usb/au0828/au0828-video.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb=
/au0828/au0828-video.c
>> index b5c88a7..5ebda64 100644
>> --- a/drivers/media/usb/au0828/au0828-video.c
>> +++ b/drivers/media/usb/au0828/au0828-video.c
>> @@ -218,9 +218,6 @@ static int au0828_init_isoc(struct au0828_dev *dev, =
int max_packets,
>>      int rc;
>>
>>      au0828_isocdbg("au0828: called au0828_prepare_isoc\n");
>> -
>> -    dev->isoc_ctl.isoc_copy =3D isoc_copy;
>> -    dev->isoc_ctl.num_bufs =3D num_bufs;
>>      dev->isoc_ctl.urb =3D kcalloc(num_bufs,
>>                      sizeof(*dev->isoc_ctl.urb),
>>                      GFP_KERNEL);
>> @@ -240,6 +237,7 @@ static int au0828_init_isoc(struct au0828_dev *dev, =
int max_packets,
>>      dev->isoc_ctl.buf =3D NULL;
>>
>>      sb_size =3D max_packets * dev->isoc_ctl.max_pkt_size;
>> +    dev->isoc_ctl.num_bufs =3D num_bufs;
>>
>>      /* allocate urbs and transfer buffers */
>>      for (i =3D 0; i < dev->isoc_ctl.num_bufs; i++) {
>> @@ -276,6 +274,7 @@ static int au0828_init_isoc(struct au0828_dev *dev, =
int max_packets,
>>              k +=3D dev->isoc_ctl.max_pkt_size;
>>          }
>>      }
>> +    dev->isoc_ctl.isoc_copy =3D isoc_copy;
>>
>>      /* submit urbs and enables IRQ */
>>      for (i =3D 0; i < dev->isoc_ctl.num_bufs; i++) {
>>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
