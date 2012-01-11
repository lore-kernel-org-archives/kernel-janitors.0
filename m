From: Steve French <smfrench@gmail.com>
Date: Wed, 11 Jan 2012 18:31:34 +0000
Subject: Re: [patch] cifs: integer overflow in parse_dacl()
Message-Id: <CAH2r5msciOkxvxTrQrN9mKKCiJvM_anmxU7sag_TGk92LoKEwQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120111074627.GA4519@elgon.mountain>
	<CADT32eLVwQT9V67BX8TkjVHDnQoYS7OqA_-xbnjY57ZXO3EfsA@mail.gmail.com>
	<CAH2r5muDQUL=0HcoFHH3QvP7C2pyy0=S9ESFBcm=qOYg3ESdxQ@mail.gmail.com>
	<20120111132053.467e8cae@tlielax.poochiereds.net>
In-Reply-To: <20120111132053.467e8cae-9yPaYZwiELC+kQycOl6kW4xkIHaj4LzF@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jeff Layton <jlayton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Shirish Pargaonkar <shirishpargaonkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We could calculate max_aces based on a minimum sized ace and maximum
smb frame size (which would be 64K presumably for Windows for
non-Writes, but larger for Samba), but not sure if it is worth the
trouble unless you find a path where we would parse beyond end of
frame,

On Wed, Jan 11, 2012 at 12:20 PM, Jeff Layton <jlayton@samba.org> wrote:
> On Wed, 11 Jan 2012 11:24:03 -0600
> Steve French <smfrench@gmail.com> wrote:
>
>> On Wed, Jan 11, 2012 at 9:50 AM, Shirish Pargaonkar
>> <shirishpargaonkar@gmail.com> wrote:
>> > On Wed, Jan 11, 2012 at 1:46 AM, Dan Carpenter <dan.carpenter@oracle.c=
om> wrote:
>> >> On 32 bit systems num_aces * sizeof(struct cifs_ace *) could overflow
>> >> leading to a smaller ppace buffer than we expected.
>> >>
>> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> >>
>> >> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
>> >> index 72ddf23..c1b2544 100644
>> >> --- a/fs/cifs/cifsacl.c
>> >> +++ b/fs/cifs/cifsacl.c
>> >> @@ -909,6 +909,8 @@ static void parse_dacl(struct cifs_acl *pdacl, ch=
ar *end_of_acl,
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0umode_t group_mask =3D S_IRWXG;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0umode_t other_mask =3D S_IRWXU | S_IRW=
XG | S_IRWXO;
>> >>
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (num_aces > ULONG_MAX / sizeof(struc=
t cifs_ace *))
>> >
>> > Should an error/warning (like cifs client can't handle these many aces=
 or
>> > possible erroneous number of aces sent by server etc.) be logged before
>> > returning?
>> >
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ppace =3D kmalloc(num_aces * sizeof(st=
ruct cifs_ace *),
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0GFP_KE=
RNEL);
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ppace) {
>>
>> Perhaps. =A0 Also note that you would overflow maximum smb size if num
>> aces is huge
>> so would you have even gotten this far?
>>
>
> Only if the smb frame is properly formed. It's possible that it's
> corrupt in such a way that the num_aces field is much larger than it
> should be, but the rest of the frame looks OK.
>
> --
> Jeff Layton <jlayton@samba.org>



--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
