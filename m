From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 08:36:36 +0000
Subject: Re: [PATCH 04/47] block-rbd: Refactor two calls for memory allocations in rbd_dev_image_id()
Message-Id: <be57263b-c2f1-db39-d438-4934c152f644@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <57806eb1-10ed-582e-72d0-2975e1ee967a@users.sourceforge.net>
 <dd52b320-58e3-48f7-f909-49bd3f388a5e@users.sourceforge.net>
 <CAOi1vP_KmPfS0EEQ14TAuQs3m3UMnzFf_oVn3ZmKvFuOGnQ_Ug@mail.gmail.com>
In-Reply-To: <CAOi1vP_KmPfS0EEQ14TAuQs3m3UMnzFf_oVn3ZmKvFuOGnQ_Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Ilya Dryomov <idryomov@gmail.com>
Cc: ceph-devel@vger.kernel.org, Alex Elder <elder@kernel.org>, Sage Weil <sage@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> @@ -5833,7 +5833,6 @@ again:
>>  static int rbd_dev_image_id(struct rbd_device *rbd_dev)
>>  {
>>         int ret;
>> -       size_t size;
>>         char *object_name;
>>         void *response;
>>         char *image_id;
>> @@ -5854,17 +5853,16 @@ static int rbd_dev_image_id(struct rbd_device *r=
bd_dev)
>>          * First, see if the format 2 image id file exists, and if
>>          * so, get the image's persistent id from it.
>>          */
>> -       size =3D sizeof (RBD_ID_PREFIX) + strlen(rbd_dev->spec->image_na=
me);
>> -       object_name =3D kmalloc(size, GFP_NOIO);
>> +       object_name =3D kmalloc(sizeof(RBD_ID_PREFIX)
>> +                             + strlen(rbd_dev->spec->image_name),
>> +                             GFP_NOIO);
>>         if (!object_name)
>>                 return -ENOMEM;
>>         sprintf(object_name, "%s%s", RBD_ID_PREFIX, rbd_dev->spec->image=
_name);
>>         dout("rbd id object name is %s\n", object_name);
>>
>>         /* Response will be an encoded string, which includes a length */
>> -
>> -       size =3D sizeof (__le32) + RBD_IMAGE_ID_LEN_MAX;
>> -       response =3D kzalloc(size, GFP_NOIO);
>> +       response =3D kzalloc(sizeof(__le32) + RBD_IMAGE_ID_LEN_MAX, GFP_=
NOIO);
>>         if (!response) {
>>                 ret =3D -ENOMEM;
>>                 goto out;
=E2=80=A6
> How is this any better?

I find it useful to omit the local variable "size" here.


> If anything, it makes the first kmalloc() call slightly less readable.

I got an other impression. The refactored function call did not fit into a =
single line
because of a well-known length limitation.

Does the kzalloc() call look a bit nicer for you now?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
