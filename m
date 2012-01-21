From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 21 Jan 2012 20:50:56 +0000
Subject: Re: busy loops in kernel
Message-Id: <alpine.DEB.2.02.1201212149560.2002@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1934736684-1327179057=:2002"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1934736684-1327179057=:2002
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Do you have any idea about the two for loops near the end of the message=20
below?  It seems strange that they would be included, unless I am=20
completely overlooking something.

julia

On Sat, 21 Jan 2012, Asim wrote:

> Yeah - most of the busy waits that are correct are short and fairly
> obvious while loops and there are plenty of them. There are some
> complex ones too.
>
> However, we do have false positive rate of 5- 8% (as measured on
> 2.6.18 kernel) - so in some (~100) cases for example the while loops
> where variables may be re-used it may report the false positive. As
> far as kernel timing is concerned - we do have mechanisms to account
> for these based on our experience with the timers used in 2.6 kernel.
> I will add these timing mechanisms and refresh the results - and
> continue to update as I encounter more diverse mechanisms to account
> for timing. But I strongly believe this a good subset to look at to
> catch these problems.
>
> Thanks,
> Asim
>
> On Sat, Jan 21, 2012 at 11:04 AM, Julia Lawall <julia.lawall@lip6.fr> wro=
te:
>> I looked at this one:
>>
>> ticks 2 =A0Infinite Loop:228 =A0Infinite Loop:600 =A0 =A0CC [M]
>> drivers/i2c/busses/i2c-xiic.o
>>
>> Line 200 looks like what you described in your previous message. =A0I do=
n't
>> understand the problem in line 600, though:
>>
>> =A0 =A0 =A0 =A0while ((fifo_space >=3D 2) && (first || (i2c->nmsgs > 1))=
) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!first) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->nmsgs--;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->tx_msg++;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->tx_pos =3D 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0first =3D 0;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (i2c->tx_msg->flags & I2C_M_RD) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* we dont date putting s=
everal reads in the FIFO */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xiic_start_recv(i2c);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xiic_start_send(i2c);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (xiic_tx_space(i2c) !=
=3D 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* the me=
ssage could not be completely sent
>> */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fifo_space =3D xiic_tx_fifo_space(i2c);
>> =A0 =A0 =A0 =A0}
>>
>> It looks like on every iteration execpt the first one, i2c->nmsgs is
>> decremented, so it will not long be greater than one.
>>
>> The next two rely on kernel timing mechansims:
>>
>> ticks 1 =A0Infinite Loop:284 =A0 =A0CC [M] =A0drivers/i2c/busses/i2c-eg2=
0t.o
>> =A0 while (ktime_lt(ktime_get(), ns_val))
>> ticks 1 =A0Infinite Loop:84 =A0 =A0CC [M] =A0drivers/i2c/busses/i2c-pca-=
isa.o
>> =A0 ret =3D time_before(jiffies, timeout); ... while (ret)
>>
>> Are these timing mechanisms unsafe?
>>
>> In this case:
>>
>> ticks 1 =A0Infinite Loop:338 =A0 =A0CC [M] =A0drivers/infiniband/hw/amso=
1100/c2.o
>>
>> it looks like it is actually the outer loop, starting on line 336, that =
is
>> unsafe.
>>
>> For this one:
>>
>> ticks 1 =A0Infinite Loop:47 =A0 =A0CC [M]
>> =A0drivers/infiniband/hw/amso1100/c2_intr.o
>>
>> I am not completely sure to understand the code. =A0c2dev->hints_read is
>> nonlocal and is never explicitly reset to 0. =A0Perhaps this code is only
>> executed once per instance of cdev. =A0In any case hints_read is increme=
nted
>> on each iteration. =A0But perhaps the value of be16_to_cpu(*c2dev->hint_=
count)
>> can also change at each access?
>>
>> This is clearly the sort of loop you described:
>>
>> ticks 1 =A0Infinite Loop:735 =A0 =A0CC [M] =A0drivers/infiniband/hw/amso=
1100/c2_qp.o
>>
>> Skipping ahead a bit, I don't at all see the problem in the following co=
de:
>>
>> ticks 1 =A0Infinite Loop:184 =A0 =A0CC [M]
>> =A0drivers/media/video/ivtv/ivtv-firmware.o
>>
>> =A0 =A0 =A0 =A0for (i =3D 0; i < size; i +=3D 0x100) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (readl(mem + i) =A0 =A0 =A0=3D=3D 0x12=
345678 &&
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readl(mem + i + 4) =A0=3D=3D 0x34=
567812 &&
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readl(mem + i + 8) =A0=3D=3D 0x56=
781234 &&
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readl(mem + i + 12) =3D=3D 0x7812=
3456) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return (volatile struct i=
vtv_mailbox __iomem *)(mem +
>> i + 16);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0}
>>
>> I don't see the problem here either:
>>
>> ticks 1 =A0Infinite Loop:93 =A0 =A0CC [M]
>> =A0drivers/media/video/pvrusb2/pvrusb2-eeprom.o
>>
>> =A0 =A0 =A0 =A0for (tcnt =3D 0; tcnt < EEPROM_SIZE; tcnt +=3D pcnt) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pcnt =3D 16;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pcnt + tcnt > EEPROM_SIZE) pcnt =3D E=
EPROM_SIZE-tcnt;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
>> =A0 =A0 =A0 =A0}
>>
>> The next report is on similar code:
>>
>> ticks 1 =A0Infinite Loop:3536 =A0 =A0CC [M]
>> =A0drivers/media/video/pvrusb2/pvrusb2-hdw.o
>>
>> These two indeed might be dangerous:
>>
>> ticks 2 =A0Infinite Loop:481 =A0Infinite Loop:676 =A0 =A0CC [M]
>> =A0drivers/media/video/saa7134/saa7134-tvaudio.o
>>
>> julia
>
--8323329-1934736684-1327179057=:2002--
