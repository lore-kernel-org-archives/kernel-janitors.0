From: Steve French <smfrench@gmail.com>
Date: Wed, 11 Jan 2012 17:24:03 +0000
Subject: Re: [patch] cifs: integer overflow in parse_dacl()
Message-Id: <CAH2r5muDQUL=0HcoFHH3QvP7C2pyy0=S9ESFBcm=qOYg3ESdxQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120111074627.GA4519@elgon.mountain>
	<CADT32eLVwQT9V67BX8TkjVHDnQoYS7OqA_-xbnjY57ZXO3EfsA@mail.gmail.com>
In-Reply-To: <CADT32eLVwQT9V67BX8TkjVHDnQoYS7OqA_-xbnjY57ZXO3EfsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Shirish Pargaonkar <shirishpargaonkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jan 11, 2012 at 9:50 AM, Shirish Pargaonkar
<shirishpargaonkar@gmail.com> wrote:
> On Wed, Jan 11, 2012 at 1:46 AM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>> On 32 bit systems num_aces * sizeof(struct cifs_ace *) could overflow
>> leading to a smaller ppace buffer than we expected.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
>> index 72ddf23..c1b2544 100644
>> --- a/fs/cifs/cifsacl.c
>> +++ b/fs/cifs/cifsacl.c
>> @@ -909,6 +909,8 @@ static void parse_dacl(struct cifs_acl *pdacl, char =
*end_of_acl,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0umode_t group_mask =3D S_IRWXG;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0umode_t other_mask =3D S_IRWXU | S_IRWXG =
| S_IRWXO;
>>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (num_aces > ULONG_MAX / sizeof(struct c=
ifs_ace *))
>
> Should an error/warning (like cifs client can't handle these many aces or
> possible erroneous number of aces sent by server etc.) be logged before
> returning?
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ppace =3D kmalloc(num_aces * sizeof(struc=
t cifs_ace *),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0GFP_KERNE=
L);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ppace) {

Perhaps.   Also note that you would overflow maximum smb size if num
aces is huge
so would you have even gotten this far?

--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
