From: Andreas Dilger <adilger@dilger.ca>
Date: Mon, 11 Feb 2019 20:38:59 +0000
Subject: Re: [PATCH] ext4: prevent very high s_inode_readahead_blks
Message-Id: <A695FC57-D150-42A9-9E55-32DC8D1AED76@dilger.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_3D210E50-F019-4E8A-B7FE-48774CBE3F77"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211184459.GB22106@kadam>
In-Reply-To: <20190211184459.GB22106@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Ext4 Developers List <linux-ext4@vger.kernel.org>, kernel-janitors@vger.kernel.org


--Apple-Mail=_3D210E50-F019-4E8A-B7FE-48774CBE3F77
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

On Feb 11, 2019, at 11:44 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> My static checker complains that "arg" can be negative.  That does seem
> possible.  I don't know if it causes an issue at run time but it seems
> safest to allow negatives.

The option declaration requires that "arg" be greater than zero:

        {Opt_inode_readahead_blks, 2, MOPT_GTE0},

and this is checked earlier in handle_mount_opt():

        if (args->from && (m->flags & MOPT_GTE0) && (arg < 0))
                return -1;

but I agree that having false static checking warnings is annoying
and potentially also hides other issues.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> fs/ext4/super.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 60da0a6e4d86..4e0845708c52 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1838,7 +1838,7 @@ static int handle_mount_opt(struct super_block *sb,
> 	} else if (token == Opt_min_batch_time) {
> 		sbi->s_min_batch_time = arg;
> 	} else if (token == Opt_inode_readahead_blks) {
> -		if (arg && (arg > (1 << 30) || !is_power_of_2(arg))) {
> +		if (arg && (arg > (1U << 30) || !is_power_of_2(arg))) {

This may "fix" the problem by virtue of implicitly forcing an unsigned
comparison, but doesn't necessarily make the issue more obvious to the
reader.

That said, it doesn't look like _any_ use of "arg" allows a negative
value, regardless of whether MOPT_GTE0 is set or not, so we should
just declare arg as an unsigned int or explicitly refuse all negatives:

	if (args->from && !(m->flags & MOPT_STRING)) {
		if (match_int(args, &arg))
			return -1;
		if (arg < 0)
			return -1;
	}

This should keep the static checker happy, since the only place that
"arg" is set away from zero it is also verified not to be negative.
At that point it would also be possible to remove MOPT_GTE0 completely.

Cheers, Andreas






--Apple-Mail=_3D210E50-F019-4E8A-B7FE-48774CBE3F77
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAlxh3WQACgkQcqXauRfM
H+D2xxAAoumeTLnQUIy54hROhS0j1AEOlzF9hIOkSxvzkT1BtMvN6SYACoYUWGKl
R0rKBu2TIEvmWl8zcgPpaDcI9fCh5ZnLU87FhdHUVgUft21/AQRvI1E6pe/GrIj0
Eq398vFvaUsCRbKjmKlBiIdl9IeQeQ1IuwO0vIYErPBb0QXPLa494PbpxXIWLqOU
n6a/TZcdeddS4oYvHTNtzNc+GD3mM5I9hBsiWU0ySYmB1ISLxvwuzQVZ2bm0MWUB
KqUzVn9QQgNdQBEpc7vNDp8fY3iOS60LKPYJrrLzSNT4b/BbXDy8dvhs+zDZ7Ipd
OC9JsHSl4NTm12Ix0bVGtrLzmuWddHE3VlCWTQoZgHcXl8PehNHqPhQVHt9i9/wm
Gi8/rkKHX62zQk6NXNGWyfByWqyI2ucjL1+Qho1O+y8tjtyKYx1DMmh0IA0F0UZP
TPq+uXlpIzIJcVaNEG44BXWQ/eixxnTrJDowSbBeZlUXUdrtcvkGRSCcsZDhS/q8
QlAfL3wgOTEEg5ebpUlxZbnTRPpCXQJGMWNJ4MaRjRNOkzKWqWSgfurscihsomdA
hTo1crIunS2IFsP3FpJOCA4fyUawb8epjgaMKenQqI+uJkEr/6qsfrMdIKvmt/lX
4zVpalGNEk4GJZiaoRdg45KLvkwKh9r90IZ5LG3Jhxuay9GgcoM=
=Vw24
-----END PGP SIGNATURE-----

--Apple-Mail=_3D210E50-F019-4E8A-B7FE-48774CBE3F77--
