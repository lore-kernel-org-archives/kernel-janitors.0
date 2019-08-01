From: Steve French <smfrench@gmail.com>
Date: Thu, 01 Aug 2019 17:00:37 +0000
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-Id: <CAH2r5msukKuhEcbpBfXOrwFEA=fyXQKSL+hDwdOFYX7DNLe8TQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com> <20190731122841.GA1974@kadam> <87lfwerze8.fsf@suse.com>
 <2f562159-8118-f4a5-9e00-c82cf0841fd5@canonical.com>
In-Reply-To: <2f562159-8118-f4a5-9e00-c82cf0841fd5@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin Ian King <colin.king@canonical.com>
Cc: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>, samba-technical <samba-technical@lists.samba.org>, Steve French <sfrench@samba.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

merged into cifs-2.6.git for-next

On Wed, Jul 31, 2019 at 10:54 AM Colin Ian King
<colin.king@canonical.com> wrote:
>
> On 31/07/2019 16:34, Aur=C3=A9lien Aptel wrote:
> > "Dan Carpenter" <dan.carpenter@oracle.com> writes:
> >> You're just turning off GCC's static analysis (and introducing false
> >> positives) when you do that.  We have seen bugs caused by this and nev=
er
> >> seen any bugs prevented by this style.
> >
> > You've never seen bugs prevented by initializing uninitialized
> > variables? Code can change overtime and I don't think coverity is
> > checked as often as it could be, meaning the var could end up being used
> > while uninitialized in the future.
>
> gcc/clang should pick up uninitialized vars at compile time. also I run
> coverity daily on linux-next.
>
> Colin
>
> >
> > Anyway I won't die on this hill, merge this if you prefer.
> >
> > Cheers,
> >
>


--=20
Thanks,

Steve
