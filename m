From: Jens Axboe <axboe@fb.com>
Date: Tue, 09 May 2017 14:50:17 +0000
Subject: Re: [PATCH] lightnvm: Remove an unused variable
Message-Id: <ff06f5a2-bff2-a366-34d4-53b993c13602@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170509093450.dgj3qghdwefpg6li@mwanda>
 <79988EFB-7909-4234-B4D9-435AAFAE2E07@lightnvm.io>
In-Reply-To: <79988EFB-7909-4234-B4D9-435AAFAE2E07@lightnvm.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 05/09/2017 04:19 AM, Javier Gonz=E1lez wrote:
>> On 9 May 2017, at 11.34, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> "rq" is never used in nvme_nvm_rqtocmd().  We also recently shifted some
>> code around so it's uninitialized and causes a static checker warning.
>> Let's just remove it.
>>
>=20
> Looks good. I didn't see it when I refactored that part.
> Matias: If it is ok with you, can you pick it up?
>=20
> Reviewed-by: Javier Gonz=E1lez <javier@cnexlabs.com>

Geert sent in a similar fix two days ago, it's already queued up:

commit 629b1b2e0e6c8285fdc21624af60e8190fa4417e
Author: Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun May 7 16:14:44 2017 +0200

    lightnvm: remove unused rq parameter of nvme_nvm_rqtocmd() to kill warn=
ing

--=20
Jens Axboe

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
