From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 08 Oct 2019 16:24:45 +0000
Subject: Re: [PATCH][next] efi/tpm: fix sanity check of unsigned tbl_size being less than zero
Message-Id: <37d9c70e-12e0-f0a1-b3ff-b2aefb39c223@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008100153.8499-1-colin.king@canonical.com>
 <20191008114559.GD25098@kadam> <20191008161553.qls5lbyaxlasw25v@cantor>
In-Reply-To: <20191008161553.qls5lbyaxlasw25v@cantor>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Ingo Molnar <mingo@kernel.org>, linux-efi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/10/2019 17:15, Jerry Snitselaar wrote:
> On Tue Oct 08 19, Dan Carpenter wrote:
>> On Tue, Oct 08, 2019 at 11:01:53AM +0100, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently the check for tbl_size being less than zero is always false
>>> because tbl_size is unsigned. Fix this by making it a signed int.
>>>
>>> Addresses-Coverity: ("Unsigned compared against 0")
>>> Fixes: e658c82be556 ("efi/tpm: Only set 'efi_tpm_final_log_size'
>>> after successful event log parsing")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>> =A0drivers/firmware/efi/tpm.c | 2 +-
>>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/firmware/efi/tpm.c b/drivers/firmware/efi/tpm.c
>>> index 703469c1ab8e..ebd7977653a8 100644
>>> --- a/drivers/firmware/efi/tpm.c
>>> +++ b/drivers/firmware/efi/tpm.c
>>> @@ -40,7 +40,7 @@ int __init efi_tpm_eventlog_init(void)
>>> =A0{
>>> =A0=A0=A0=A0 struct linux_efi_tpm_eventlog *log_tbl;
>>> =A0=A0=A0=A0 struct efi_tcg2_final_events_table *final_tbl;
>>> -=A0=A0=A0 unsigned int tbl_size;
>>> +=A0=A0=A0 int tbl_size;
>>> =A0=A0=A0=A0 int ret =3D 0;
>>
>>
>> Do we need to do a "ret =3D tbl_size;"?=A0 Currently we return success.
>> It's a pitty that tpm2_calc_event_log_size() returns a -1 instead of
>> -EINVAL.
>>
>> regards,
>> dan carpenter
>>
>=20
> perhaps "ret =3D -EINVAL;"? Currently nothing checks the return value of
> efi_tpm_eventlog_init though.

I doubt I'll fix that for my current fix as a V2.
