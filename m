From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jun 2012 19:17:27 +0000
Subject: Re: [patch] eCryptfs: fix ecryptfs_privileged_open() for read only files
Message-Id: <20120612191622.GO13539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120609091129.GD877@elgon.mountain>
In-Reply-To: <20120609091129.GD877@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jun 12, 2012 at 12:02:47PM -0700, Tyler Hicks wrote:
> On 2012-06-09 12:11:29, Dan Carpenter wrote:
> > The intent here is to handle read only opens differently.  For example,
> > if we don't want to create the file if it doesn't exist.  The problem
> > here is that O_RDONLY is 0 and if (x & 0) {... is always false.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Thanks, Dan! I committed a slightly different fix with more context in
> the commit message (because I had to remind myself what was going on
> with that conditional in the first place).
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/tyhicks/ecryptfs.git;a=3Dcomm=
itdiff;h=91425d9b57c024bf8b28055b6a480809fe0941ee
>=20

Looks good.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
