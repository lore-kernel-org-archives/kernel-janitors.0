From: Jens Axboe <axboe@fb.com>
Date: Fri, 09 Jun 2017 15:57:49 +0000
Subject: Re: [PATCH][-next] loop: fix incorrect nesting levels on braces in nested if statements
Message-Id: <7929f1eb-d796-6eba-52de-3c19ddcd2723@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170609155425.21260-1-colin.king@canonical.com>
In-Reply-To: <20170609155425.21260-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Ming Lei <tom.leiming@gmail.com>, Hannes Reinecke <hare@suse.de>, Omar Sandoval <osandov@fb.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/09/2017 09:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Adding another set of braces clarifies the block and ensures that
> both the setting of err and the error exit are executed on the
> deepest nested if statement.
>=20
> Detected by CoverityScan, CID#1440959 ("Nesting level does not
> match indentation")

Already fixed:

http://git.kernel.dk/cgit/linux-block/commit/?h=3Dfor-4.13/block&id=B040ad9=
cf6a169cc000a5324fcada695dfa1f4b3

--=20
Jens Axboe

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
