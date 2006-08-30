From: =?ISO-8859-1?Q?Artur_D=27Assump=E7=E3o?= <ad@tagus.ist.utl.pt>
Date: Wed, 30 Aug 2006 17:27:01 +0000
Subject: Re: [KJ] [Patch] [updated] use time_after macro in iphase.c
Message-Id: <44F5CA65.8030801@tagus.ist.utl.pt>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156937382.24061.5.camel@localhost.localdomain>
In-Reply-To: <1156937382.24061.5.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Darren Jenkins wrote:
> G'day Artur
>
> On 8/30/06, Artur D'Assump=E7=E3o <ad@tagus.ist.utl.pt> wrote:
>> Hi Darren,
>>
>> Haven't you read Matheus and Nishanths sugestions?
>
> I thought I did.
Sorry if i've sounded to rough, not my intention (language barrier).
>
>>
>> Darren Jenkins\ wrote:
>> > G'day list.
>> >
>> > This is the second part of the split up patch and it applies on top of
>> > "[KJ][Patch][updated] use HZ relative values instead of absolute=20
>> values
>> > in iphase.c"
>> >
>> > Use the time_after macro's in iphase.c and remove a now redundant
>> > variable.
>> >
>> > Compile tested with allyesconfig
>> >
>> > Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
>> > --- drivers/atm/iphase.c.patch1       2006-08-30 14:46:22.000000000=20
>> +1000
>> > +++ drivers/atm/iphase.c      2006-08-30 15:14:43.000000000 +1000
>> > @@ -184,12 +184,11 @@ static u16 get_desc (IADEV *dev, struct
>> >    u_short            desc_num, i;
>> >    struct sk_buff        *skb;
>> >    struct ia_vcc         *iavcc_r =3D NULL;
>> > -  unsigned long delta;
>> >    static unsigned long timer =3D 0;
>> >    int ltimeout;
>> >
>> >    ia_hack_tcq (dev);
>> > -  if(((jiffies -=20
>> timer)>HZ/2)||((dev->ffL.tcq_rd=3Ddev->host_tcq_wr))){
>> > +  if(time_after(jiffies,=20
>> (timer+HZ/2))||((dev->ffL.tcq_rd=3Ddev->host_tcq_wr))){
>> >
>> I guess Nishanth has already said something about this. Isn't supposed
>> the driver to wait 50ms as the original code sugested? If yes, an
>> arbitrary wait value may break its functionality. The kernel's default
>> HZ value is 1000, but it can also change through make config! So I guess
>> we can't relly too much on it's value for these wait statements. IMHO I
>> believe msec_to_jiffies(50) would be the best approach here, since you
>> would have the correct jiffies calculalation that will allow the driver
>> to wait aproximatly 50ms! Please someone correct me if i'm wrong.
>
> Ok the whole point of using HZ/2 is to make the value of HZ irrelevant
> to the time calculations.
> The HZ value represents how many jiffies in a second, so HZ/2
> represents the number of jiffies in half a second, no matter what the
> value of HZ is. So the code above checks if half a second has passed
> since timer was assigned it's value.
> on line 192:      timer =3D jiffies;
>
> Now you are right about HZ being 1000 (on i386) before it was made
> configurable.
> However it used to be 100 even before that (2.4), and Matthew Wilcox
> pointed out that the 2.4 driver used the same 50 values.
> http://lists.osdl.org/pipermail/kernel-janitors/2006-August/006974.html
> I checked and all the 50's in the 2.6 driver were 50's in the 2.4
> driver. This means that the delay was supposed to be Half a second,
> (50 being half of the then HZ value 100) and that's why I used HZ/2
> instead of HZ/20.
> Now I didn't use msec_to_jiffies() like Nish suggested for a number of=20
> reasons.
> I guess one is taste :), an other is that in a half second delay, the
> precision of HZ/2 is fine and I thought the code was just as clear.
> Also being a bit-pinching Uc guy I really don't like inline functions.
> ;)
>
Ok, that was what I was trying to say, if you have certain that the=20
driver is ment to wait half a second then I don't see no problem here=20
and HZ/2 then sounds ok.
>
>
>> >       timer =3D jiffies;
>> >       i=3D0;
>> >       while (i < dev->num_tx_desc) {
>> > @@ -198,9 +197,11 @@ static u16 get_desc (IADEV *dev, struct
>> >             continue;
>> >          }
>> >          ltimeout =3D dev->desc_tbl[i].iavcc->ltimeout;
>> > -        delta =3D jiffies - dev->desc_tbl[i].timestamp;
>> > -        if (delta >=3D ltimeout) {
>> > -           IF_ABR(printk("RECOVER run!! desc_tbl %d =3D %d  delta =3D=
=20
>> %ld, time =3D %ld\n", i,dev->desc_tbl[i].timestamp, delta, jiffies);)
>> >
>> You could also add a printk message level to this statement! (in a
>> different patch).
>> > +        if (time_after_eq(jiffies,
>> > +             ((unsigned long)dev->desc_tbl[i].timestamp+ltimeout))) {
>> > +           IF_ABR(printk("RECOVER run!! desc_tbl %d =3D %d  delta =3D=
=20
>> %ld, time =3D %ld\n",
>> > +             i, dev->desc_tbl[i].timestamp,
>> >
>> printk message level
>> > +             (jiffies-dev->desc_tbl[i].timestamp), jiffies);)
>> >             if (dev->ffL.tcq_rd =3D dev->ffL.tcq_st)
>> >                dev->ffL.tcq_rd =3D  dev->ffL.tcq_ed;
>> >             else
>> > @@ -1223,7 +1224,7 @@ static void rx_intr(struct atm_dev *dev)
>> >          iadev->rx_tmp_jif =3D jiffies;
>> >          iadev->rxing =3D 0;
>> >       }
>> > -     else if (((jiffies - iadev->rx_tmp_jif) > HZ/2) &&
>> >
>> The same above.
>> > +     else if (time_after(jiffies, ((unsigned=20
>> long)iadev->rx_tmp_jif + HZ/2)) &&
>> >
>> The same above and...
>>
>> Hmmm! If the iadev->rx_tmp_jif represents a temporary jiff timestamp,
>> shouldn't be more correct to change it to and unsigned long type instead
>> of casting it since it serves only that purpose? Despite unsigned int
>> has enough precision to represent an unsigned long (4 bytes), thats a
>> mistake. This approach should remove the necessity of casting and make
>> the code and the variable usage far more clear.
>> Someone please correct me here if i'm wrong!
>
> You are right here.
> However this is a minor janitorial patch, and as I can't test my
> changes (beyond compilation) I wouldn't feel comfortable altering
> things without good reason
> Have a look at the time_after() macro and friends. They check the type
> of the arguments are unsigned long. I wanted to make as little change
> as possible in the code so I just cast the arguments to required type
> so it doesn't generate warnings.
Yap, we've talked about that remember? I'm "flea" at #kerneljantors.

I understand very well and I respect your choices.

Anyway I have to disagree here in one point. I don't think this is a=20
janitorial patch tough, but rather a potencial bug fix. When we're stick=20
to i386 arch we know that the internal kernel representation of an=20
unsigned long has 4 bytes (jiffies one, although it has 64bits) and=20
rx_tmp_jif is stated has an u32 type. Until here I agree that a cast=20
does resolve the nasty warnings, although it isn't very pretty to see if=20
it's avoidable.
Anyway there are architectures where the internal unsigned long=20
representation is 8 bytes wide and this timestamp may well loose=20
precision here. It's difficult with this timer resolution for an 8byte=20
precision to overflow (584 million years?!? :P), but an 4byte may well=20
overflow (50 days at 1000 HZ). The time_after() function does handle=20
well with unsigned long (4 byte) counter wrap arounds, but I don't know=20
if because of the potencial different data types width at compare, there=20
could be situations where this could actually fail.

I guess I'd prefer to stick with the unsigned long representation since=20
it's the native jiffies one and leaves out doubts. I don't know if i'm=20
exagerating here, but please someone be free to correct me if I am=20
(*blush*). :)
>
>> >                 ((iadev->rx_pkt_cnt - iadev->rx_tmp_cnt) =3D 0)) {
>> >          for (i =3D 1; i <=3D iadev->num_rx_desc; i++)
>> >                 free_desc(dev, i);
>> >
>> >
>> Artur DAssumpcao
>
>
>
> Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
