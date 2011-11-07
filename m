From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 07 Nov 2011 11:58:35 +0000
Subject: Re: [PATCH 3/5] net/mac80211/debugfs.c: use kstrtoul, etc
Message-Id: <alpine.DEB.2.02.1111071258160.2527@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1619784325-1320667116=:2527"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320586010-21931-1-git-send-email-julia@diku.dk> <1320586010-21931-4-git-send-email-julia@diku.dk> <CAB3XZEfHV+sO=+vJdZUQVqXFtHvZyhJQ1Cm8LJ8Puyz9eqq9Kg@mail.gmail.com>
In-Reply-To: <CAB3XZEfHV+sO=+vJdZUQVqXFtHvZyhJQ1Cm8LJ8Puyz9eqq9Kg@mail.gmail.com>
To: Eliad Peller <eliad@wizery.com>
Cc: Julia Lawall <julia@diku.dk>, "John W. Linville" <linville@tuxdriver.com>, kernel-janitors@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1619784325-1320667116=:2527
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable



On Mon, 7 Nov 2011, Eliad Peller wrote:

> On Sun, Nov 6, 2011 at 3:26 PM, Julia Lawall <julia@diku.dk> wrote:
>> From: Julia Lawall <julia@diku.dk>
>>
>> Use kstrtoul, etc instead of the now deprecated strict_strtoul, etc.
>>
>> A semantic patch rule for the kstrtoul case is as follows:
>> (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @@
>> expression a,b;
>> {int,long} *c;
>> @@
>>
>> -strict_strtoul
>> +kstrtoul
>> =A0(a,b,c)
>> // </smpl>
>>
>> Signed-off-by: Julia Lawall <julia@diku.dk>
>>
>> ---
>> =A0net/mac80211/debugfs.c | =A0 =A02 +-
>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff -u -p a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
>> --- a/net/mac80211/debugfs.c
>> +++ b/net/mac80211/debugfs.c
>> @@ -190,7 +190,7 @@ static ssize_t uapsd_max_sp_len_write(st
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
>> =A0 =A0 =A0 =A0buf[len] =3D '\0';
>>
>> - =A0 =A0 =A0 ret =3D strict_strtoul(buf, 0, &val);
>> + =A0 =A0 =A0 ret =3D kstrtoul(buf, 0, &val);
>>
>> =A0 =A0 =A0 =A0if (ret)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>>
>
> maybe while cleaning it up change copy_from_user +
> strict_stroul/kstroul -> kstroul_from_user?

Thanks for the suggestion.  I will look into it.

julia
--8323329-1619784325-1320667116=:2527--
