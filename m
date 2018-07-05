From: Tyler Hicks <tyhicks@canonical.com>
Date: Thu, 05 Jul 2018 14:52:18 +0000
Subject: Re: [PATCH] eCryptfs: fix a couple type promotion bugs
Message-Id: <20180705145218.GA29046@sec>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093556.dlosbefurp2o42zs@kili.mountain>
In-Reply-To: <20180704093556.dlosbefurp2o42zs@kili.mountain>
To: kernel-janitors@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2018-07-04 12:35:56, Dan Carpenter wrote:
> ECRYPTFS_SIZE_AND_MARKER_BYTES is type size_t, so if "rc" is negative
> that gets type promoted to a high positive value and treated as success.
>=20
> Fixes: 778aeb42a708 ("eCryptfs: Cleanup and optimize ecryptfs_lookup_inte=
rpose()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan!

I made a small change to use "if/else if" rather than "if/if". I've
pushed the patch to the ecryptfs next branch.

Tyler

>=20
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 4dd842f72846..506f2a0bba41 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1018,8 +1018,10 @@ int ecryptfs_read_and_validate_header_region(struc=
t inode *inode)
> =20
>  	rc =3D ecryptfs_read_lower(file_size, 0, ECRYPTFS_SIZE_AND_MARKER_BYTES,
>  				 inode);
> +	if (rc < 0)
> +		return rc;
>  	if (rc < ECRYPTFS_SIZE_AND_MARKER_BYTES)
> -		return rc >=3D 0 ? -EINVAL : rc;
> +		return -EINVAL;
>  	rc =3D ecryptfs_validate_marker(marker);
>  	if (!rc)
>  		ecryptfs_i_size_init(file_size, inode);
> @@ -1381,8 +1383,10 @@ int ecryptfs_read_and_validate_xattr_region(struct=
 dentry *dentry,
>  				     ecryptfs_inode_to_lower(inode),
>  				     ECRYPTFS_XATTR_NAME, file_size,
>  				     ECRYPTFS_SIZE_AND_MARKER_BYTES);
> +	if (rc < 0)
> +		return rc;
>  	if (rc < ECRYPTFS_SIZE_AND_MARKER_BYTES)
> -		return rc >=3D 0 ? -EINVAL : rc;
> +		return -EINVAL;
>  	rc =3D ecryptfs_validate_marker(marker);
>  	if (!rc)
>  		ecryptfs_i_size_init(file_size, inode);
> --
> To unsubscribe from this list: send the line "unsubscribe ecryptfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJbPjCiAAoJENaSAD2qAscKJnIP/1JQlr+uTAVD0PSHf737Z5ah
NQuqzSi7SYZGmG18/McKbYMvP9zW0osOjD9TPJM1zGFblPRIOVFeYy+JdiBB+L28
JCkyv92sshZLoeV2GkrQq4Vi9qNSI3nUR5q5N1PaSORyEmgRe9SdWh8EHBEe2Y+9
dAiRBDdlWbqsYquA/BVOp83ZEgMRJj8W+WOt5SwUi/mqtEa5Wld2kvQcGzcFjdkz
ljk5+FKabizJ/0HFFds4y9Or08J4upSNjPgeToJDD7Q7M4rw7gFUGfiTIZUCdBzn
D8N86Ve9cCfkd7+llrMEBW2G69ogSLsT3r76T8P5wVnd1ZKPU+bbVpSKDLVE7NLt
W6EGhoC07JTssoOx395szbLNRZr4FUeGc87OUgPyc4qzfkSG74H9jOLxIebSUTRb
EEEgNx5QtrgqdnOdu2zC7Gv2av364Emolgj95G3ySd7dnH8MHfrbL8DCGo5SnqOW
6BtQiwLQwoSZ6cjyEDQtvkgp0M8XRLdVjjmFRu6RIwlRjIK9qunbhN81vD1hK4la
4mR/uzm906K7Nv7wLyi2eljHLxR1N//0QlmmEFXG/ZDwwGmkWugtFPthBbffjv1F
ss1TbMfkZH6zWrkpBadh0lsT1YFILr6dIKlUNd04PYhB7/gvujnHx/+vVyPinQYg
dcU5uYN8SiUEQJR1KctC
=Tcsp
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
