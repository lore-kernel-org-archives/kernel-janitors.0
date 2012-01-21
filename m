From: Asim <linkasim@gmail.com>
Date: Sat, 21 Jan 2012 22:32:08 +0000
Subject: Re: busy loops in kernel
Message-Id: <CAFTXMEKCkRj=g6y5KUSYzG_JbrEVbQgwVRRGU7Zi7eQB7Yoegg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Yeah - these are not the strongest parts of the analyses. Lately, as
we have added more busses, interprocedural analyses and supported
newer kernels, we've seen more problems. In the first example, CIL(our
underlying analysis language) cannot distinguish between for and while
loops. To distinguish for loops and to eliminate certain class of
timers, we try to detect for loops and counters by searching for
integers that increment/decrement by 1. Here, it increments by 25, and
it is not caught as a for loop. Then, the intermediate code generated
for this is :

#line 185
    tmp___7 =3D readl((void const volatile   *)(mem + i));
#line 185
    if (tmp___7 =3D 305419896U) {
#line 185
      tmp___8 =3D readl((void const volatile   *)((mem + i) + 4));
#line 185
      if (tmp___8 =3D 878082066U) {
#line 185
        tmp___9 =3D readl((void const volatile   *)((mem + i) + 8));
#line 185
        if (tmp___9 =3D 1450709556U) {
#line 185
          tmp___10 =3D readl((void const volatile   *)((mem + i) + 12));
#line 185
          if (tmp___10 =3D 2014458966U) {
#line 189
            return ((struct ivtv_mailbox  volatile  *)((mem + i) + 16));
          }


Here it detects, that the exit condition is dependent on a read from
device, and marks this loop as a suspect. Apart from random
increments, we also face problems with casts used while detecting loop
exit conditions/for loops. Second one is a bug in how i2c_transfer
function is handled (i2c bus was added sometime this year). I've fixed
it and will update results shorty...

As I mentioned in my previous email, I would perhaps give priority to
the simpler examples that are plenty..


Thanks,
Asim

On Sat, Jan 21, 2012 at 12:50 PM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> Do you have any idea about the two for loops near the end of the message
> below? =A0It seems strange that they would be included, unless I am compl=
etely
> overlooking something.
>
> julia
>
>
> On Sat, 21 Jan 2012, Asim wrote:
>
>> Yeah - most of the busy waits that are correct are short and fairly
>> obvious while loops and there are plenty of them. There are some
>> complex ones too.
>>
>> However, we do have false positive rate of 5- 8% (as measured on
>> 2.6.18 kernel) - so in some (~100) cases for example the while loops
>> where variables may be re-used it may report the false positive. As
>> far as kernel timing is concerned - we do have mechanisms to account
>> for these based on our experience with the timers used in 2.6 kernel.
>> I will add these timing mechanisms and refresh the results - and
>> continue to update as I encounter more diverse mechanisms to account
>> for timing. But I strongly believe this a good subset to look at to
>> catch these problems.
>>
>> Thanks,
>> Asim
>>
>> On Sat, Jan 21, 2012 at 11:04 AM, Julia Lawall <julia.lawall@lip6.fr>
>> wrote:
>>>
>>> I looked at this one:
>>>
>>> ticks 2 =A0Infinite Loop:228 =A0Infinite Loop:600 =A0 =A0CC [M]
>>> drivers/i2c/busses/i2c-xiic.o
>>>
>>> Line 200 looks like what you described in your previous message. =A0I d=
on't
>>> understand the problem in line 600, though:
>>>
>>> =A0 =A0 =A0 =A0while ((fifo_space >=3D 2) && (first || (i2c->nmsgs > 1)=
)) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!first) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->nmsgs--;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->tx_msg++;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->tx_pos =3D 0;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0first =3D 0;
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (i2c->tx_msg->flags & I2C_M_RD) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* we dont date putting =
several reads in the FIFO
>>> */
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xiic_start_recv(i2c);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xiic_start_send(i2c);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (xiic_tx_space(i2c) !=
=3D 0) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* the m=
essage could not be completely
>>> sent
>>> */
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fifo_space =3D xiic_tx_fifo_space(i2c);
>>> =A0 =A0 =A0 =A0}
>>>
>>> It looks like on every iteration execpt the first one, i2c->nmsgs is
>>> decremented, so it will not long be greater than one.
>>>
>>> The next two rely on kernel timing mechansims:
>>>
>>> ticks 1 =A0Infinite Loop:284 =A0 =A0CC [M] =A0drivers/i2c/busses/i2c-eg=
20t.o
>>> =A0 while (ktime_lt(ktime_get(), ns_val))
>>> ticks 1 =A0Infinite Loop:84 =A0 =A0CC [M] =A0drivers/i2c/busses/i2c-pca=
-isa.o
>>> =A0 ret =3D time_before(jiffies, timeout); ... while (ret)
>>>
>>> Are these timing mechanisms unsafe?
>>>
>>> In this case:
>>>
>>> ticks 1 =A0Infinite Loop:338 =A0 =A0CC [M] =A0drivers/infiniband/hw/ams=
o1100/c2.o
>>>
>>> it looks like it is actually the outer loop, starting on line 336, that
>>> is
>>> unsafe.
>>>
>>> For this one:
>>>
>>> ticks 1 =A0Infinite Loop:47 =A0 =A0CC [M]
>>> =A0drivers/infiniband/hw/amso1100/c2_intr.o
>>>
>>> I am not completely sure to understand the code. =A0c2dev->hints_read is
>>> nonlocal and is never explicitly reset to 0. =A0Perhaps this code is on=
ly
>>> executed once per instance of cdev. =A0In any case hints_read is
>>> incremented
>>> on each iteration. =A0But perhaps the value of
>>> be16_to_cpu(*c2dev->hint_count)
>>> can also change at each access?
>>>
>>> This is clearly the sort of loop you described:
>>>
>>> ticks 1 =A0Infinite Loop:735 =A0 =A0CC [M]
>>> =A0drivers/infiniband/hw/amso1100/c2_qp.o
>>>
>>> Skipping ahead a bit, I don't at all see the problem in the following
>>> code:
>>>
>>> ticks 1 =A0Infinite Loop:184 =A0 =A0CC [M]
>>> =A0drivers/media/video/ivtv/ivtv-firmware.o
>>>
>>> =A0 =A0 =A0 =A0for (i =3D 0; i < size; i +=3D 0x100) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (readl(mem + i) =A0 =A0 =A0=3D 0x1234=
5678 &&
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readl(mem + i + 4) =A0=3D 0x3456=
7812 &&
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readl(mem + i + 8) =A0=3D 0x5678=
1234 &&
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0readl(mem + i + 12) =3D 0x781234=
56) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return (volatile struct =
ivtv_mailbox __iomem
>>> *)(mem +
>>> i + 16);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> =A0 =A0 =A0 =A0}
>>>
>>> I don't see the problem here either:
>>>
>>> ticks 1 =A0Infinite Loop:93 =A0 =A0CC [M]
>>> =A0drivers/media/video/pvrusb2/pvrusb2-eeprom.o
>>>
>>> =A0 =A0 =A0 =A0for (tcnt =3D 0; tcnt < EEPROM_SIZE; tcnt +=3D pcnt) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pcnt =3D 16;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pcnt + tcnt > EEPROM_SIZE) pcnt =3D =
EEPROM_SIZE-tcnt;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
>>> =A0 =A0 =A0 =A0}
>>>
>>> The next report is on similar code:
>>>
>>> ticks 1 =A0Infinite Loop:3536 =A0 =A0CC [M]
>>> =A0drivers/media/video/pvrusb2/pvrusb2-hdw.o
>>>
>>> These two indeed might be dangerous:
>>>
>>> ticks 2 =A0Infinite Loop:481 =A0Infinite Loop:676 =A0 =A0CC [M]
>>> =A0drivers/media/video/saa7134/saa7134-tvaudio.o
>>>
>>> julia
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
