From: Steve Magnani <steve.magnani@digidescorp.com>
Date: Tue, 19 Feb 2019 14:17:09 +0000
Subject: Re: [PATCH][udf-next] udf: don't call mark_buffer_dirty on a null bh pointer
Message-Id: <aef899da-4dc1-1e40-30c9-fc2ca87f2380@digidescorp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219114403.24771-1-colin.king@canonical.com>
 <20190219140240.GA31849@quack2.suse.cz>
In-Reply-To: <20190219140240.GA31849@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jan Kara <jack@suse.cz>, Colin King <colin.king@canonical.com>
Cc: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/19/19 8:02 AM, Jan Kara wrote:
> On Tue 19-02-19 11:44:03, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a null check on the pointer bh to avoid a null pointer derefere=
nce
>> on bh->b_data however later bh is passed to mark_buffer_dirty that can a=
lso
>> cause a null pointer dereference on bh.  Avoid this potential null point=
er
>> dereference by moving the call to mark_buffer_dirty inside the null chec=
ked
>> block.
>>
>> Fixes: e8b4274735e4 ("udf: finalize integrity descriptor before writebac=
k")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Thanks for the patch! In fact it is the 'if (bh)' check that's
> unnecessarily defensive (we cannot have sbi->s_lvid_dirty and
> !sbi->s_lvid_bh). So I'll just drop that check (attached patch).
>
> 								Honza
>
>> ---
>>   fs/udf/super.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/udf/super.c b/fs/udf/super.c
>> index a6940d90bedd..b7e9a83d39db 100644
>> --- a/fs/udf/super.c
>> +++ b/fs/udf/super.c
>> @@ -2336,13 +2336,13 @@ static int udf_sync_fs(struct super_block *sb, i=
nt wait)
>>  =20
>>   			lvid =3D (struct logicalVolIntegrityDesc *)bh->b_data;
>>   			udf_finalize_lvid(lvid);
>> -		}
>>  =20
>> -		/*
>> -		 * Blockdevice will be synced later so we don't have to submit
>> -		 * the buffer for IO
>> -		 */
>> -		mark_buffer_dirty(bh);
>> +			/*
>> +			 * Blockdevice will be synced later so we don't have
>> +			 * to submit the buffer for IO
>> +			 */
>> +			mark_buffer_dirty(bh);
>> +		}
>>   		sbi->s_lvid_dirty =3D 0;
>>   	}
>>   	mutex_unlock(&sbi->s_alloc_mutex);
>> --=20
>> 2.20.1
>>
Reviewed-by: Steven J. Magnani <steve@digidescorp.com>

Doh! Thanks for the catch Colin.

------------------------------------------------------------------------
 =A0Steven J. Magnani=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "I claim th=
is network for MARS!
 =A0www.digidescorp.com=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Earthling, r=
eturn my space modulator!"

 =A0#include <standard.disclaimer>
