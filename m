From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Feb 2012 20:08:35 +0000
Subject: Re: [patch] ocfs2: cleanup error handling in o2hb_alloc_hb_set()
Message-Id: <20120213200835.GK4141@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iSeZnk6FyAS3EJ1y"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120213135047.GA10683@elgon.mountain>
	<4F3966EF.9070405@oracle.com>
In-Reply-To: <4F3966EF.9070405@oracle.com>
To: ocfs2-devel@oss.oracle.com


--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 13, 2012 at 11:39:27AM -0800, Sunil Mushran wrote:
> hmm... I would say NAK because config_group_item_type_name() could
> change in the future. And there is nothing wrong with the current
> code.

The error handling isn't correct because checking "&hs->hs_group"
for NULL doesn't work.  "hs" and "&hs->hs_group" are the same
address and we checked "hs" already.  If we wanted to check for
allocation errors, then we would need to change the check to:

        if (!hs->hs_group.cg_item.ci_name)
		kfree(hs);

But that's not how the function is supposed to be used.  The example
code in Documentation/filesystems/configfs/configfs_example_explicit.c
doesn't have error handling.

regards,
dan carpenter


--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPOW3CAAoJEOnZkXI/YHqRCs4P/2MJ1B4SvcP3KeL8QImaD0a6
+ZsIECdr4FdHrxy3Lmu45GnDE7tuLiFf7r7qxRUwShOLL65dvXJQRfiN4sqpA6hd
xD1UWTZ5pb0dffDjW/naL9oGAPZCNfZF3Ithhok0QtxNCdg4LuYwH4XWWAsIy8T+
2ToWY3mxDz+sEkDJkpgPF7kNw6Urz5xk2864K/VhYOzYTBaKNxD+XTUjWud8ixoc
05PZD5Vk2sgxcSA6uo/Zvfx7rH1T7iWNWADww9YvllE5mOP8g71ArTmANXElNwit
uWajsG3VJy+xd2siykJuwpxqdHeevatLf8Q77qQJJdNdwQnNcn+vxJRYkpnGegoh
Qi38Ka2uUBEt7T7CfeDP8LVuICp4mS2SFx67tyfhsvnmMAdsy46rKoXzQnB9yHQB
qcoUwNetc4PuFmmxivPfG7ghUqUYODuXWtTeHf4tbRovUCsK1dCXDscGeBr/Z80F
qn/RM6Ku/VZTYrPqAI7ywhrWoxOVdcTcReadBRL/XdNB6NBR1U/xcSR6BwjqEbR5
a6VEeGX4QHY83O81BvTIMqBqRq9q7W0swm8fpsmQgjhoneXTuR0rt6btAudv2jJ0
HFdYMe0qT4KmMmE7XLyWb+2c3cWnJFdDybgOsWF6qGhSXjPk763l3jWJlKdVlE6W
H1/l/NVdlJi+92lk22PM
=p2ZB
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--
