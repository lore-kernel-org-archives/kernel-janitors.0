From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Sat, 06 Mar 2010 00:21:30 +0000
Subject: Re: mysterious -1 offset in staging rt2860 driver
Message-Id: <82faac5b1003051621q59520668o2c9d7575cff54176@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100304191403.GA24075@bicker>
In-Reply-To: <20100304191403.GA24075@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Mar 5, 2010 at 6:14 AM, Dan Carpenter <error27@gmail.com> wrote:
> So here is a mystery for people who enjoy such mysterious things.
>
> drivers/staging/rt2860/sta_ioctl.c +1020 rt_ioctl_giwscan(219)
> =A01011 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (CAP_IS_PRIVACY_ON
> =A01012 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(pAdapter->ScanTab.Bss=
Entry[i].CapabilityInfo))
> =A01013 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0iwe.u.data.fla=
gs =3D IW_ENCODE_ENABLED | IW_ENCODE_NOKEY;
> =A01014 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A01015 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0iwe.u.data.fla=
gs =3D IW_ENCODE_DISABLED;
> =A01016
> =A01017 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__smatch_value("iwe.u.data.fla=
gs");
> =A01018 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0previous_ev =3D current_ev;
> =A01019 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0current_ev > =A01020 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0iwe_stream_add_point(info, current_ev, e=
nd_buf, &iwe,
> =A01021 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (char *)pAdapter->
> =A01022 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 SharedKey[BSS0][(iwe.u.data.
> =A01023 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0flags &
> =A01024 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IW_ENCODE_INDEX) -
> =A01025 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1].Key);
>
>
> That last bit is easier to read if it's on one line.
>
> SharedKey[BSS0][(iwe.u.data.flags & IW_ENCODE_INDEX) - 1].Key);
>
> iwe.u.data.flags is either 0x0400 or 0x8000. =A0IW_ENCODE_INDEX is 0xff, =
so
> after we mask off the lower bits we get 0x00 and then we subtract 1 we get
> an array offset of -1.
>
> I doubt that's what we want, but what _do_ we want here?
>

Looking at the use of IW_ENCODE_INDEX elsewhere it seems to be a mask
for a key value that can be 0..4 where 0 means some default value and
1 - 4 means use value-- ie 0 - 3.

iwe.u.data.flags is assigned to 1 earlier so I would assume the code should=
 be

                                iwe.u.data.flags  &=3D ~ IW_ENCODE_FLAGS
>>   1011                  if (CAP_IS_PRIVACY_ON
>>   1012                      (pAdapter->ScanTab.BssEntry[i].CapabilityInf=
o))
>>   1013                          iwe.u.data.flags |=3D IW_ENCODE_ENABLED =
| IW_ENCODE_NOKEY;
>>   1014                  else
>>   1015                          iwe.u.data.flags |=3D IW_ENCODE_DISABLED;

Which I think would both make sense and give an array index of 0.


Darren J.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
