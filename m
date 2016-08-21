From: Vaishali Thakkar <vaishali.thakkar@oracle.com>
Date: Sun, 21 Aug 2016 12:21:48 +0000
Subject: Re: [PATCH] staging/lustre/llite: Use memdup_user() rather than duplicating its implementation
Message-Id: <57B99A0C.3060407@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <73da135c-be81-e915-9b7a-6773e730b4e7@users.sourceforge.net>
 <66b32046-56ee-430e-e80e-1cdd5a8e68c4@wanadoo.fr>
 <alpine.DEB.2.10.1608210628040.4152@hadrien> <57B98890.7070900@oracle.com>
 <alpine.DEB.2.10.1608210700050.4152@hadrien>
In-Reply-To: <alpine.DEB.2.10.1608210700050.4152@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Sunday 21 August 2016 04:31 PM, Julia Lawall wrote:
>=20
>=20
> On Sun, 21 Aug 2016, Vaishali Thakkar wrote:
>=20
>>
>>
>> On Sunday 21 August 2016 04:01 PM, Julia Lawall wrote:
>>>
>>>
>>> On Sun, 21 Aug 2016, Christophe JAILLET wrote:
>>>
>>>> Le 21/08/2016 =E0 11:45, SF Markus Elfring a =E9crit :
>>>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>>>> Date: Sun, 21 Aug 2016 11:30:57 +0200
>>>>>
>>>>> Reuse existing functionality from memdup_user() instead of keeping
>>>>> duplicate source code.
>>>>>
>>>>> This issue was detected by using the Coccinelle software.
>>>>>
>>>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>>>> ---
>>>>>   drivers/staging/lustre/lustre/llite/dir.c | 12 +++---------
>>>>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/lustre/lustre/llite/dir.c
>>>>> b/drivers/staging/lustre/lustre/llite/dir.c
>>>>> index 031c9e4..8b70e42 100644
>>>>> --- a/drivers/staging/lustre/lustre/llite/dir.c
>>>>> +++ b/drivers/staging/lustre/lustre/llite/dir.c
>>>>> @@ -1676,14 +1676,9 @@ out_poll:
>>>>>   	case LL_IOC_QUOTACTL: {
>>>>>   		struct if_quotactl *qctl;
>>>>>   -		qctl =3D kzalloc(sizeof(*qctl), GFP_NOFS);
>>>> Same as previously reported in another patch, GFP_NOFS has not the same
>>>> meaning than GPF_KERNEL.
>>>> So your proposed clean-up is not 100% equivalent.
>>>>
>>>> Are your sure that GPF_KERNEL instead of GFP_NOFS is right in this cod=
e?
>>>>
>>>> Maybe, the coccinelle check should be tweak to only spot "kzalloc(...,
>>>> GFP_KERNEL)" allocation?
>>>
>>> To my dim recollection, GFP_NOFS is not actually allowed in a place whe=
re
>>> copy_from_user is being used.  copy_from_user can block due to page
>>> faults, and GFP_NOFS is used when a certain kind of blocking is not
>>> allowed.  So if the code really needs GFP_NOFS, then something else is
>>> wrong.
>>>
>>> The semantic patch intentionally does not specify GFP_KERNEL for this
>>> reason, ie so that these issues will come up and be discussed.  On the
>>> ther hand I agree about the GFP_DMA case, since that doesn't relate to
>>> blocking, as far as I know.  The semantic patch should be updated to not
>>> make/propose the change in that case.
>>
>> I think semantic patch should be updated for all possible flags except
>> GFP_NOFS and GFP_ATOMIC. Because only using these 2 flags with
>> copy_from_user can cause blocking.
>=20
> They don't cause blocking, but rather prevent it.

Yes, sorry. I meant blocking functions which may sleep in between.

> But people could use variables as well.  Since other things are rare, it
> seems like it could be better to only block reports on what is known to
> be safe, and not to block reports on unknown things.  A warning could be
> given in some cases.

Sounds reasonable. Warning will work I guess.

> julia
>=20
>>
>>> julia
>>>
>>>>
>>>>> -		if (!qctl)
>>>>> -			return -ENOMEM;
>>>>> -
>>>>> -		if (copy_from_user(qctl, (void __user *)arg, sizeof(*qctl))) {
>>>>> -			rc =3D -EFAULT;
>>>>> -			goto out_quotactl;
>>>>> -		}
>>>>> +		qctl =3D memdup_user((void __user *)arg, sizeof(*qctl));
>>>>> +		if (IS_ERR(qctl))
>>>>> +			return PTR_ERR(qctl);
>>>>>     		rc =3D quotactl_ioctl(sbi, qctl);
>>>>>   @@ -1691,7 +1686,6 @@ out_poll:
>>>>>   					    sizeof(*qctl)))
>>>>>   			rc =3D -EFAULT;
>>>>>   -out_quotactl:
>>>>>   		kfree(qctl);
>>>>>   		return rc;
>>>>>   	}
>>>>
>>>>
>>>>
>>>> ---
>>>> L'absence de virus dans ce courrier =E9lectronique a =E9t=E9 v=E9rifi=
=E9e par le
>>>> logiciel antivirus Avast.
>>>> https://www.avast.com/antivirus
>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe kernel-janit=
ors" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>
>> --
>> Vaishali
>>
>=20

--=20
Vaishali
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
