From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Feb 2012 09:55:58 +0000
Subject: Re: [PATCH] Initialise buffer and buffer_size before used
Message-Id: <20120227095558.GA2817@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330331985-20767-2-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1330331985-20767-2-git-send-email-ruan.zhengwang@gmail.com>
To: kernel-janitors@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 04:39:45PM +0800, Zhengwang Ruan wrote:
> GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, a=
nd
> 'buffer' is used as returned value, and 'buffer_size' is initialized using
> uninitialized_var to clear warning.
>=20

If you wanted to use the uninitialized_var() macro for a pointer,
the trick is:

	struct binder_buffer *uninitialized_var(buffer);

But this is fine as is.

The subject should have a subsystem prefix.  You'll need to resend
both patches for that reason.  (You had them correct in the original
version you sent to kj).  The subjects could also say [patch 1/2]
and [patch 2/2] but it doesn't matter since the line numbers didn't
change and they can be applied in any order.

Don't forget to CC Greg.  He reads the list as well, but you should
always CC a maintainer and a list for each patch.

Anyway, it looks good.  Just fix the subjects and resend.  When you
resend a patch it should say [patch 1/2 v2] in the subject and below
the signed off by line put:
---
v2: added a subsystem prefix to the subject

Sorry that it's a lot of nit picky work.  We have to push as much
work as we can on to patch submitters so that maintainers can apply
things with a click of the mouse.  After a while you'll learn all
the rules.  :)

regards,
dan carpenter


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPS1MuAAoJEOnZkXI/YHqRASIP/ir5OErjpzYU90uLJ/fZLuuw
6ODrQHfbgQga/6ZBl8xYQAtw0nERuvOyIWmZ05OskqawwHvRSAXOWTWBSUGJwqJ7
RgzlB+tljFbq24rdIEoST5dA/6zagH1aswX1Mc7Rruu1F+wQSAP8Xglp7hmWlc6s
bnIh0jfWWut++nYpAHk1ROSz66qJXj5oZOTdxajFiUBh8xZoZD15AuIKmEhAZC7g
LygeIyuy2PvU2aiXCEHCEBAxgSwq+AQw0c/p/4/3AacYUFtGhz149KnJ49fi3p+X
kWLX9DAL6TM8zYqp5YYx8W/ppSa0UJEohIdhzdLCX1Q1NjXogC5Plxc+teaMqS5G
7jUqjjRnz8IBHpcLMU7AbYgN93xLR4xIB2TvMWm9gn0Sf0AibjsHqStFRjwckJA+
mlcpbvMzYLVKS+ptSThpT4Sthdg7JMeg6Fn+jXfkLqTJT4OrdTD/8wHBwknnSQFn
sIfnHIbqjmvnNplbc4NSzPzwSyyNWAkyvaqMMSEDmami/vMPOOXEVrA4BaDquLiN
7WIuuuIyB2/MQDagmqG0ebqwgeXrDBrTN+rImLgBxRajOWpiO63Js3IztJLKtt5V
bxz3uf1IQLGvpoQpK1/LNy868hlwL3IbHnLeKQ7Xnkc0b7gIv72My06zRP7QxrfE
xDKVrsYl2oHcWYIPnuUs
=ZO99
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
