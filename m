From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 02 Feb 2021 12:37:57 +0000
Subject: Re: [PATCH] ceph: Fix an Oops in error handling
Message-Id: <f0477211cafbdc24883e978ab976610333f5fb67.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBjne8A1gn0mvQtT@mwanda>
In-Reply-To: <YBjne8A1gn0mvQtT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, David Howells <dhowells@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2021-02-02 at 08:47 +0300, Dan Carpenter wrote:
> The "req" pointer is an error pointer and not NULL so this check needs
> to be fixed.
>=20
> Fixes: 1cf7fdf52d5a ("ceph: convert readpage to fscache read helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> =A0fs/ceph/addr.c | 2 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 5eec6f66fe52..fb0238a4d34f 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -273,7 +273,7 @@ static void ceph_netfs_issue_op(struct netfs_read_sub=
request *subreq)
> =A0	if (err)
> =A0		iput(inode);
> =A0out:
> -	if (req)
> +	if (!IS_ERR_OR_NULL(req))
> =A0		ceph_osdc_put_request(req);
> =A0	if (err)
> =A0		netfs_subreq_terminated(subreq, err);

Good catch.

David, could you take this into your fscache-next branch?

Reviewed-by: Jeff Layton <jlayton@kernel.org>
