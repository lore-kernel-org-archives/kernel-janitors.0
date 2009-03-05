From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 20:15:18 +0000
Subject: Re: [PATCH v2 09/15] NULL noise: drivers/scsi/FlashPoint.c
Message-Id: <154e089b0903051215q1216aa53icd41556e2af8b234@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
	 <20090305191602.30062.71301.stgit@f10box.hanneseder.net>
	 <1236283546.5626.45.camel@localhost.localdomain>
In-Reply-To: <1236283546.5626.45.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>

On Thu, Mar 5, 2009 at 9:05 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Thu, 2009-03-05 at 20:16 +0100, Hannes Eder wrote:
>> Fix this sparse warnings:
>> =A0 drivers/scsi/FlashPoint.c:906:9: warning: Using plain integer as NUL=
L pointer
>> =A0 drivers/scsi/FlashPoint.c:907:53: warning: Using plain integer as NU=
LL pointer
>> =A0 drivers/scsi/FlashPoint.c:922:1: warning: Using plain integer as NUL=
L pointer
>>
>> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>> ---
>> v2: fix checkpatch.pl issue.
>> v2.1: other subject, as suggested by Al Viro
>>
>> =A0drivers/scsi/FlashPoint.c | =A0 =A07 +++----
>> =A01 files changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/scsi/FlashPoint.c b/drivers/scsi/FlashPoint.c
>> index b898d38..9eb2e86 100644
>> --- a/drivers/scsi/FlashPoint.c
>> +++ b/drivers/scsi/FlashPoint.c
>> @@ -903,8 +903,8 @@ static void FPT_autoCmdCmplt(unsigned long p_port, u=
nsigned char p_card);
>> =A0static void FPT_autoLoadDefaultMap(unsigned long p_port);
>>
>> =A0static struct sccb_mgr_tar_info FPT_sccbMgrTbl[MAX_CARDS][MAX_SCSI_TA=
R] >> L- =A0 =A0{ {{0}} };
>> -static struct sccb_card FPT_BL_Card[MAX_CARDS] =3D { {0} };
>> + =A0 =A0{ { {NULL} } };
>> +static struct sccb_card FPT_BL_Card[MAX_CARDS] =3D { {NULL} };
>> =A0static SCCBSCAM_INFO FPT_scamInfo[MAX_SCSI_TAR] =3D { {{0}} };
>> =A0static struct nvram_info FPT_nvRamInfo[MAX_MB_CARDS] =3D { {0} };
>
> This doesn't look right: =A0{0} as a structure initialiser is a C
> convention for zero fill this structure; sparse should recognise this.
> Of course, since these structures are static, they should be in BSS
> anyway ...

So a proper fix is just not to initialize the variables.

... and report this issue to the sparse mailing list.

>
>> @@ -918,8 +918,7 @@ static unsigned char FPT_scamHAString[] >>
>> =A0static unsigned short FPT_default_intena =3D 0;
>>
>> -static void (*FPT_s_PhaseTbl[8]) (unsigned long, unsigned char) =3D {
>> -0};
>> +static void (*FPT_s_PhaseTbl[8]) (unsigned long, unsigned char) =3D {NU=
LL};
>>
>> =A0/*-------------------------------------------------------------------=
--
>> =A0 *

Same her, right?
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
