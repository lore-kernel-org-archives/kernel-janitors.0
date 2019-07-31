From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 31 Jul 2019 15:54:31 +0000
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-Id: <2f562159-8118-f4a5-9e00-c82cf0841fd5@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com> <20190731122841.GA1974@kadam>
 <87lfwerze8.fsf@suse.com>
In-Reply-To: <87lfwerze8.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, kernel-janitors@vger.kernel.org, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org

On 31/07/2019 16:34, Aur=C3=A9lien Aptel wrote:
> "Dan Carpenter" <dan.carpenter@oracle.com> writes:
>> You're just turning off GCC's static analysis (and introducing false
>> positives) when you do that.  We have seen bugs caused by this and never
>> seen any bugs prevented by this style.
>=20
> You've never seen bugs prevented by initializing uninitialized
> variables? Code can change overtime and I don't think coverity is
> checked as often as it could be, meaning the var could end up being used
> while uninitialized in the future.

gcc/clang should pick up uninitialized vars at compile time. also I run
coverity daily on linux-next.

Colin

>=20
> Anyway I won't die on this hill, merge this if you prefer.
>=20
> Cheers,
>=20
