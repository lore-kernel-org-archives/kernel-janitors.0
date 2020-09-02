From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 02 Sep 2020 19:39:23 +0000
Subject: Re: [PATCH] RDMA/ucma: fix memory leak of mc on an xa_alloc failure
Message-Id: <a86f5b1b-29f8-991f-a46b-fabc3566b15d@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d9ee4ee-b145-5776-aec5-cfb6124e6a6b@web.de>
In-Reply-To: <3d9ee4ee-b145-5776-aec5-cfb6124e6a6b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>

On 02/09/2020 20:03, Markus Elfring wrote:
>> Currently when an xa_alloc failure occurs the error exit path leaks
>> the allocated object mc.  Fix this by adding an error return path
>> that frees mc and rename error exit paths err3 to err4 and err2 to err3.
>=20
> I propose to choose further alternatives for numbered labels.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?id=9C7d619be5a002ea29c172df5e3c1227c2=
2cbb41#n485
>=20
> Regards,
> Markus
>=20
That's nice
