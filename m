From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 03 Mar 2012 07:44:46 +0000
Subject: Re: [PATCH] arch: x86: kernel: kprobes: functions with definition should not be declared extern
Message-Id: <20120303074446.GJ22598@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="huG+SbfbdD6eblZQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330725391-9439-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1330725391-9439-1-git-send-email-emilgoode@gmail.com>
To: kernel-janitors@vger.kernel.org


--huG+SbfbdD6eblZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Looks good.

Change the subject prefix to: kprobes/x86:
get this by typing:
	git log --pretty=oneline arch/x86/kernel/kprobes.c


Maybe choose a shorter subject.  Such as "remove extern from
function definition."

Perhaps line wrap the commit log at 72 characters.
sparse warns:
arch/x86/kernel/kprobes.c:1489:13: warning:
	function 'arch_unoptimize_kprobes' with external linkage
	has definition

Resend to the people from ./scripts/get_maintainer.pl

regargs,
dan carpenter


--huG+SbfbdD6eblZQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPUcvuAAoJEOnZkXI/YHqRcDEP+wfpy9wxWoWEGKQZgQ2cVWvL
5Xxmu5wHyzVjbrHoSkEbeuV0Hl7v6lZdk55ULywVwwXqykFkzB2dw9ryD7EXT9nT
zuCb5VCA/My1ab+FgYN9R7biI2xzbWajgxVt7Q10XPMMpCvzE/vXk8uWTtdP4wIO
7QeSGB7v7UZeLZVHVfD7bJCDwb4/S2IHL0lfdyt4dNh8bYaz6uoqJPFtHDTAZGGX
yEp3BxDMUSwNv7yjMGbF9gAlPJr4R7qxDhawdsaQmSeWsQNUW5OQSvuf+M3kzlOd
Pm4BcyQLwAciIj4JHjQJdewXRCjhqAASwbrhGq1pNQ8FPt3iqjYgiNZsf5sa+aR3
TAIi6p68QkpH/v8U6sO59E3apO2aLTSdN7JeAYsO3rmacBXMdING5iYaojO/V3uj
iAN9E3KmwlW4L+Kd4FZIMBhUlnCPXaXQfjtpQfety/loeLXtXhmDVbjhGV1N6dvU
yRH4JQI7+qwT05QZnKUOPm0Sh8yEQHE49y5yEl7HQsitNY1g9PzFC4wHXjCWk63W
NtNsjZDoGSNyTQ8Rpt+BB90hYEMh7HIoMtqQOLnRcLJSkRA5An2TRvIEJY3tJb4h
GVXS0uens7VdhKen0LP5TDdZqsqvt3+KjrEWOi8wWQwWFLG5iIjiPUPA7nIhu5QH
5JioRCgd33YK59I4Pgvq
=5hgX
-----END PGP SIGNATURE-----

--huG+SbfbdD6eblZQ--
