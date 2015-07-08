From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 08 Jul 2015 05:45:16 +0000
Subject: Re: [PATCH] [SCSI] FlashPoint: optimize string comparison
Message-Id: <559CB8EC.1090008@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436247543-7326-1-git-send-email-christophe.jaillet@wanadoo.fr> <CAH6sp9PzQUPo2_VczkEtwzhYW8AcNTqNYWF6kwMvk_N8peGhxg@mail.gmail.com> <559C06B4.2010808@gonehiking.org>
In-Reply-To: <559C06B4.2010808@gonehiking.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Khalid Aziz <khalid@gonehiking.org>, Frans Klaver <fransklaver@gmail.com>
Cc: JBottomley@odin.com, linux-scsi@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le 07/07/2015 19:04, Khalid Aziz a =C3=A9crit :
> On 07/07/2015 02:45 AM, Frans Klaver wrote:
>> On Tue, Jul 7, 2015 at 7:39 AM, Christophe JAILLET
>> <christophe.jaillet@wanadoo.fr> wrote:
>>> Stop comparing the strings as soon as we know that they don't match.
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>>   drivers/scsi/FlashPoint.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/scsi/FlashPoint.c b/drivers/scsi/FlashPoint.c
>>> index 5c74e4c..24a4d1a 100644
>>> --- a/drivers/scsi/FlashPoint.c
>>> +++ b/drivers/scsi/FlashPoint.c
>>> @@ -6280,8 +6280,10 @@ static unsigned char FPT_scmachid(unsigned=20
>>> char p_card,
>>>                  match =3D 1;
>>>
>>>                  for (k =3D 0; k < ID_STRING_LENGTH; k++) {
>>> -                       if (p_id_string[k] !=3D=20
>>> FPT_scamInfo[i].id_string[k])
>>> +                       if (p_id_string[k] !=3D=20
>>> FPT_scamInfo[i].id_string[k]) {
>>>                                  match =3D 0;
>>> +                               break;
>>> +                       }
>>>                  }
>>>
>>>                  if (match) {
>>
>> Why doesn't this use strncmp?
>>
>> Thanks,
>> Frans
>>
>
> I suspect that is how this code came from Mylex many years ago. Using=20
> strncmp would indeed be a better way to clean this up. Also, further=20
> down in the same routine:
>
>                 if (FPT_scamInfo[match].state =3D ID_UNUSED) {
>                         for (k =3D 0; k < ID_STRING_LENGTH; k++) {
>                                 FPT_scamInfo[match].id_string[k] >       =
                              p_id_string[k];
>                         }
>
>
> This should use strncpy instead. There is another similar spot further=20
> down.
>
> Christophe, if you can send a new patch with these clean-ups, that=20
> would be great.
>
> Thanks,
> Khalid

Hi,

I'm sorry but I won't propose a new patch for that.

I had the same reaction at first (why not use strncmp?) but it seems to=20
be the way this driver is coded. Should we want to introduce strncmp=20
here, then, as you have noticed, strcpy should be used to. memset could=20
be also used in many places. Then looking elsewhere in the code, many=20
things should, IMHO, also be fixed. (use consistently empty lines=20
before/after code ; use consistently { }...)

Another concern to me is "the use of carriage return". In the following=20
examples, things could be much more readable if not limited to 50 chars=20
per line, or so.

1357  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L1357=
>                                  FPT_sccbMgrTbl  <http://lxr.free-electro=
ns.com/ident?i=3DFPT_sccbMgrTbl>[thisCard][id  <http://lxr.free-electrons.c=
om/ident?i=3Did>  * 2 +
1358  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L1358=
>                                                           i  <http://lxr.=
free-electrons.com/ident?i=3Di>].TarStatus |1359  <http://lxr.free-electron=
s.com/source/drivers/scsi/FlashPoint.c#L1359>                              =
        SYNC_SUPPORTED  <http://lxr.free-electrons.com/ident?i=3DSYNC_SUPPO=
RTED>;

or

4850  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4850=
>                                                  FPT_sccbMgrTbl  <http://=
lxr.free-electrons.com/ident?i=3DFPT_sccbMgrTbl>[p_card]
4851  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4851=
>                                                      [currSCCB->TargID].
4852  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4852=
>                                                      TarLUNBusy[0] =3D 1;
4853  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4853=
>                                                  if (currSCCB->Sccb_tag) {
4854  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4854=
>                                                          if (FPT_BL_Card =
 <http://lxr.free-electrons.com/ident?i=3DFPT_BL_Card>[p_card].
4855  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4855=
>                                                              discQCount !=
=3D 0)
4856  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4856=
>                                                                  FPT_BL_C=
ard  <http://lxr.free-electrons.com/ident?i=3DFPT_BL_Card>
4857  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4857=
>                                                                      [p_c=
ard].
4858  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4858=
>                                                                      disc=
QCount--;
4859  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4859=
>                                                          FPT_BL_Card  <ht=
tp://lxr.free-electrons.com/ident?i=3DFPT_BL_Card>[p_card].
4860  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4860=
>                                                              discQ_Tbl[cu=
rrSCCB->
4861  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4861=
>                                                                        Sc=
cb_tag]
4862  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4862=
>                                                              =3DNULL  <ht=
tp://lxr.free-electrons.com/ident?i=3DNULL>;
4863  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4863=
>                                                  } else {
4864  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4864=
>                                                          if (FPT_BL_Card =
 <http://lxr.free-electrons.com/ident?i=3DFPT_BL_Card>[p_card].
4865  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4865=
>                                                              discQCount !=
=3D 0)
4866  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4866=
>                                                                  FPT_BL_C=
ard  <http://lxr.free-electrons.com/ident?i=3DFPT_BL_Card>
4867  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4867=
>                                                                      [p_c=
ard].
4868  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4868=
>                                                                      disc=
QCount--;
4869  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4869=
>                                                          FPT_BL_Card  <ht=
tp://lxr.free-electrons.com/ident?i=3DFPT_BL_Card>[p_card].
4870  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4870=
>                                                              discQ_Tbl
4871  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4871=
>                                                              [FPT_sccbMgr=
Tbl  <http://lxr.free-electrons.com/ident?i=3DFPT_sccbMgrTbl>
4872  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4872=
>                                                               [p_card][cu=
rrSCCB->
4873  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4873=
>                                                                        Ta=
rgID].
4874  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4874=
>                                                               LunDiscQ_Id=
x[0]] 4875  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c=
#L4875>                                                              NULL  =
<http://lxr.free-electrons.com/ident?i=3DNULL>;
4876  <http://lxr.free-electrons.com/source/drivers/scsi/FlashPoint.c#L4876=
>                                                  }


I only reported an easy fix based on a semi-automatic detection of code=20
that could be improved. I don't want to make some much more heavy=20
changes that could break the code.

Best regards,
CJ
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
