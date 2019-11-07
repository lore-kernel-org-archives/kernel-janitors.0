From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 07 Nov 2019 08:45:55 +0000
Subject: Re: [PATCH] ovl: create UUIDs for file systems that do not set the superblock UUID
Message-Id: <02adb5f3-10be-1827-f48b-b621bd61783a@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106234301.283006-1-colin.king@canonical.com>
 <CAOQ4uxhT4pFzHjjKyoMOc3xVXXqyqc37zd=-pCx2+keA4e6NAg@mail.gmail.com>
In-Reply-To: <CAOQ4uxhT4pFzHjjKyoMOc3xVXXqyqc37zd=-pCx2+keA4e6NAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, overlayfs <linux-unionfs@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On 07/11/2019 07:08, Amir Goldstein wrote:
> On Thu, Nov 7, 2019 at 1:43 AM Colin King <colin.king@canonical.com> wrot=
e:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Some file systems such as squashfs do not set the UUID in the
>> superblock resulting in a zero'd UUID.  In cases were two or more
>> of these file systems are overlayed on the lower layer we can hit
>> overlay corruption issues because identical zero'd overlayfs UUIDs
>> are impossible to differentiate between.  This can be fixed by
>> creating an overlayfs UUID based on the file system from the
>> superblock s_magic and s_dev fields.  (This currently seems like
>> enough information to be able create a UUID, but the could be
>> scope to use other super block fields such as the pointer s_fs_info
>> but may need some obfuscation).
>>
>=20
> The fix is incorrent. uuid stored in xattr needs to have persistent prope=
rties.
> In the use case that you describe, the origin file handle should simply be
> ignored.
>=20
> Please test attached patch.

Thanks for the patch. Tested, and the error still occurs:

[  163.959633] overlayfs: invalid origin (etc/.pwd.lock, ftype=8000,
origin ftype@00).

Colin

>=20
> Thanks,
> Amir.
>=20
