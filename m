From: =?utf-8?B?IkthaSBNw6RraXNhcmEgKEtvbHVtYnVzKSI=?=  <kai.makisara@kolumbus.fi>
Date: Sun, 05 Aug 2018 09:14:32 +0000
Subject: Re: [PATCH] st: remove redundant pointer STbuffer
Message-Id: <5FB12D0E-73B3-4A5B-BAB8-7D3DF7979EF1@kolumbus.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803104752.17081-1-colin.king@canonical.com>
In-Reply-To: <20180803104752.17081-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



> On 3 Aug 2018, at 13.47, Colin King <colin.king@canonical.com> wrote:
>=20
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Pointer STbuffer is being assigned but is never used hence it is
> redundant and can be removed.
>=20
> Cleans up clang warning:
> warning: variable 'STbuffer' set but not used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Kai M=C3=A4kisara <kai.makisara@kolumbus.fi>

Has been unused at least since 2005 :-)

Thanks,
Kai

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
