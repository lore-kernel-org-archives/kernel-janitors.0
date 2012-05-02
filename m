From: Tomas Melin <tomas.melin@iki.fi>
Date: Wed, 02 May 2012 18:10:31 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <CACraW2pLVnUM+o6oRTp7TgUhKgiG8mOKDn-2_5KO736YjpLahQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,
> the fix is nice but the org code has  if (!n_char > 1) return 1 but now y=
ou have
> if (nchar =3D 1 ) is there any reason not to use ( nchar <=3D 1 ) ?
> (i do not see the whole code and it is not clear from your changelog)
You are missing out the last "else", basically the original code was
if n_chan <1
     return 0
if n_chan >1
     //do some counting
     return count
else
    return 1

For n_chan=3D1 the function doesn't actually do anything clever, that's
why I made the return right at the beginning.

Tomas

>
> re,
>  wh



On Wed, May 2, 2012 at 8:41 PM, walter harms <wharms@bfs.de> wrote:
>
>
> Am 02.05.2012 18:13, schrieb Tomas Melin:
>> -Simplified function logic by assuming that n_chan >1 if not <=3D1. Remo=
ves
>> one level of indentation.
>> -> readability improved and code fits into 80 chars
>> - Code indentation fixes, corrected comments
>> - Added braces to if() for readability
>>
>> Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
>> ---
>> =A0drivers/staging/comedi/drivers/adv_pci1710.c | =A0 84 +++++++++++++--=
-----------
>> =A01 files changed, 43 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/stag=
ing/comedi/drivers/adv_pci1710.c
>> index 8318c82..fa4a6fb 100644
>> --- a/drivers/staging/comedi/drivers/adv_pci1710.c
>> +++ b/drivers/staging/comedi/drivers/adv_pci1710.c
>> @@ -1142,9 +1142,9 @@ static int pci171x_ai_cmd(struct comedi_device *de=
v, struct comedi_subdevice *s)
>>
>> =A0/*
>> =A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - Check if channel list from user is builded correctly
>> - If it's ok, then program scan/gain logic.
>> - This works for all cards.
>> + * Check if channel list from user is build correctly
>> + * If it's ok, then program scan/gain logic.
>> + * This works for all cards.
>> =A0*/
>> =A0static int check_channel_list(struct comedi_device *dev,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct comedi_su=
bdevice *s,
>> @@ -1160,48 +1160,50 @@ static int check_channel_list(struct comedi_devi=
ce *dev,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 if (n_chan > 1) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 chansegment[0] =3D chanlist[0]; =A0 /* =A0firs=
t channel is every time ok */
>> - =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 1, seglen =3D 1; i < n_chan; i++, s=
eglen++) { =A0 =A0/* =A0build part of chanlist */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* =A0printk("%d. %d %d\n",i,C=
R_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chanlist[0] =3D chanlist[i=
])
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break; =A0/* =
=A0we detect loop, this must by finish */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (CR_CHAN(chanlist[i]) & 1) =
=A0 /* =A0odd channel cann't by differencial */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (CR_AREF(ch=
anlist[i]) =3D AREF_DIFF) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 comedi_error(dev,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Odd channel can't be differential input!\n"=
);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 return 0;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nowmustbechan >> - =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (CR_CHAN(chansegment[i - 1]) + 1) % s-=
>n_chan;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (CR_AREF(chansegment[i - 1]=
) =3D AREF_DIFF)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nowmustbechan =
=3D (nowmustbechan + 1) % s->n_chan;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nowmustbechan !=3D CR_CHAN=
(chanlist[i])) { =A0 =A0/* =A0channel list isn't continuous :-( */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ("chan=
nel list must be continuous! chanlist[%i]=3D%d but must be %d or %d!\n",
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i, =
CR_CHAN(chanlist[i]), nowmustbechan,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CR_=
CHAN(chanlist[0]));
>> + =A0 =A0 if (n_chan =3D 1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 1; /* seglen=3D1 */
>> +
>> + =A0 =A0 /* n_chan must be >1 */
>> + =A0 =A0 /* first channel is every time ok */
>> + =A0 =A0 chansegment[0] =3D chanlist[0];
>> + =A0 =A0 /* =A0build part of chanlist */
>> + =A0 =A0 for (i =3D 1, seglen =3D 1; i < n_chan; i++, seglen++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (chanlist[0] =3D chanlist[i])
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break; /* detected loop, done =
*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (CR_CHAN(chanlist[i]) & 1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (CR_AREF(chanlist[i]) =3D A=
REF_DIFF) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 comedi_error(d=
ev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Odd channel c=
an't be differential input!\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chansegment[i] =3D chanlist[i]=
; =A0 /* =A0well, this is next correct channel in list */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> -
>> - =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0, segpos =3D 0; i < n_chan; i++) {=
 =A0 =A0 =A0/* =A0check whole chanlist */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* printk("%d %d=3D%d %d\n",CR=
_CHAN(chansegment[i%seglen]),CR_RANGE(chansegment[i%seglen]),CR_CHAN(chanli=
st[i]),CR_RANGE(chanlist[i])); */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chanlist[i] !=3D chansegme=
nt[i % seglen]) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ("bad =
channel, reference or range number! chanlist[%i]=3D%d,%d,%d and not %d,%d,%=
d!\n",
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i, =
CR_CHAN(chansegment[i]),
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CR_=
RANGE(chansegment[i]),
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CR_=
AREF(chansegment[i]),
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CR_=
CHAN(chanlist[i % seglen]),
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CR_=
RANGE(chanlist[i % seglen]),
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CR_=
AREF(chansegment[i % seglen]));
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0; =A0 =
=A0 =A0 /* =A0chan/gain list is strange */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 nowmustbechan =3D (CR_CHAN(chansegment[i - 1])=
 + 1) % s->n_chan;
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (CR_AREF(chansegment[i - 1]) =3D AREF_DIFF)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nowmustbechan =3D (nowmustbech=
an + 1) % s->n_chan;
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* =A0channel list isn't continuous :-( */
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (nowmustbechan !=3D CR_CHAN(chanlist[i])) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "channel list =
must be continuous! chanlist[%i]=3D%d but must be %d or %d!\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i, CR_CHAN(cha=
nlist[i]), nowmustbechan,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CR_CHAN(chanli=
st[0]));
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* =A0well, this is next correct channel in li=
st */
>> + =A0 =A0 =A0 =A0 =A0 =A0 chansegment[i] =3D chanlist[i];
>> + =A0 =A0 }
>> + =A0 =A0 /* =A0check whole chanlist */
>> + =A0 =A0 for (i =3D 0, segpos =3D 0; i < n_chan; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (chanlist[i] !=3D chansegment[i % seglen]) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "bad channel, =
reference or range number! chanlist[%i]=3D%d,%d,%d and not %d,%d,%d!\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i, CR_CHAN(cha=
nsegment[i]),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CR_RANGE(chans=
egment[i]),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CR_AREF(chanse=
gment[i]),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CR_CHAN(chanli=
st[i % seglen]),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CR_RANGE(chanl=
ist[i % seglen]),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CR_AREF(chanse=
gment[i % seglen]));
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0; /* =A0chan/gain list=
 is strange */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 } else {
>> - =A0 =A0 =A0 =A0 =A0 =A0 seglen =3D 1;
>> =A0 =A0 =A0 }
>> =A0 =A0 =A0 return seglen;
>> =A0}
>
> hi Tomas,
> the fix is nice but the org code has =A0if (!n_char > 1) return 1 but now=
 you have
> if (nchar =3D 1 ) is there any reason not to use ( nchar <=3D 1 ) ?
> (i do not see the whole code and it is not clear from your changelog)
>
> re,
> =A0wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
