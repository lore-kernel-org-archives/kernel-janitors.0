From: Saeed Mahameed <saeed@kernel.org>
Date: Wed, 10 Feb 2021 05:42:41 +0000
Subject: Re: [PATCH] net/mlx5: docs: correct section reference in table of contents
Message-Id: <28f0dde76d1dbc666a4eaf9e5b23eaec9989aad8.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210205095506.29146-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210205095506.29146-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Parav Pandit <parav@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2021-02-05 at 10:55 +0100, Lukas Bulwahn wrote:
> Commit 142d93d12dc1 ("net/mlx5: Add devlink subfunction port
> documentation") refers to a section 'mlx5 port function' in the table
> of
> contents, but includes a section 'mlx5 function attributes' instead.
>=20
> Hence, make htmldocs warns:
>=20
> =C2=A0 mlx5.rst:16: WARNING: Unknown target name: "mlx5 port function".
>=20
> Correct the section reference in table of contents to the actual name
> of
> section in the documentation.
>=20
> Also, tune another section underline while visiting this document.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Saeed, please pick this patch for your -next tree on top of the
> commit above.

Applied to net-next-mlx5,

Thanks,
Saeed.
