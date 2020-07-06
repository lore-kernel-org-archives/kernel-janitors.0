From: Paul Cercueil <paul@crapouillou.net>
Date: Mon, 06 Jul 2020 23:52:29 +0000
Subject: Re: [PATCH] i2c: jz4780: remove redundant assignment to variable i
Message-Id: <HNN2DQ.3HHBK0781A0A1@crapouillou.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610125901.1134204-1-colin.king@canonical.com>
        <20200704063217.GG1041@kunai>
In-Reply-To: <20200704063217.GG1041@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wolfram Sang <wsa@kernel.org>
Cc: Colin King <colin.king@canonical.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Le sam. 4 juil. 2020 =E0 8:32, Wolfram Sang <wsa@kernel.org> a =E9crit :
> On Wed, Jun 10, 2020 at 01:59:01PM +0100, Colin King wrote:
>>  From: Colin Ian King <colin.king@canonical.com>
>>=20
>>  The variable i is being initialized with a value that is
>>  never read and it is being updated later with a new value. The
>>  initialization is redundant and can be removed.
>>=20
>>  Addresses-Coverity: ("Unused value")
>>  Signed-off-by: Colin Ian King <colin.king@canonical.com>
>=20
> What about 'ret'? Doesn't the same reasoning apply for it?
>=20

That's correct.

Colin, could you respin the patch and do the same for the 'ret'=20
variable?

Thanks,
-Paul
