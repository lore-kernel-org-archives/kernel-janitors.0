From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2021 14:19:57 +0000
Subject: Re: [PATCH] ceph: Fix an Oops in error handling
Message-Id: <20210202141957.GC20820@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBjne8A1gn0mvQtT@mwanda>
 <f0477211cafbdc24883e978ab976610333f5fb67.camel@kernel.org>
In-Reply-To: <f0477211cafbdc24883e978ab976610333f5fb67.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jeff Layton <jlayton@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 02, 2021 at 07:37:57AM -0500, Jeff Layton wrote:
> On Tue, 2021-02-02 at 08:47 +0300, Dan Carpenter wrote:
> > The "req" pointer is an error pointer and not NULL so this check needs
> > to be fixed.
> >=20
> > Fixes: 1cf7fdf52d5a ("ceph: convert readpage to fscache read helper")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > =A0fs/ceph/addr.c | 2 +-
> > =A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > index 5eec6f66fe52..fb0238a4d34f 100644
> > --- a/fs/ceph/addr.c
> > +++ b/fs/ceph/addr.c
> > @@ -273,7 +273,7 @@ static void ceph_netfs_issue_op(struct netfs_read_s=
ubrequest *subreq)
> > =A0	if (err)
> > =A0		iput(inode);
> > =A0out:
> > -	if (req)
> > +	if (!IS_ERR_OR_NULL(req))
> > =A0		ceph_osdc_put_request(req);
> > =A0	if (err)
> > =A0		netfs_subreq_terminated(subreq, err);
>=20
> Good catch.
>=20
> David, could you take this into your fscache-next branch?
>=20
> Reviewed-by: Jeff Layton <jlayton@kernel.org>

Jeff sent a different fix for this.  Let's just apply his instead.

regards,
dan carpenter
