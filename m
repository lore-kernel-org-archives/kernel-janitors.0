From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Nov 2011 10:47:11 +0000
Subject: Re: [PATCH] drivers/staging/vt6656/iwctl.c: Remove PRINT_K macro
Message-Id: <20111107104711.GW4682@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vIq7vvlOcsOjFaxi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320634885-5845-1-git-send-email-marcos.mage@gmail.com>
In-Reply-To: <1320634885-5845-1-git-send-email-marcos.mage@gmail.com>
To: kernel-janitors@vger.kernel.org


--vIq7vvlOcsOjFaxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2011 at 07:27:52AM -0300, Marcos Souza wrote:
> 2011/11/7, Dan Carpenter <dan.carpenter@oracle.com>:
> > Hi Marcos,
> >
> > This should be sent to devel@driverdev.osuosl.org as well.
> On copy this time
> > DBG_PRT() is just as bad as PRINT_K().  The first example in
> > iwctl_siwscan() should be either pr_debug() or dev_dbg().  Also the
> > message itself is wrong.
> So, I'll send patches to change all these print_k and dbg_prt to dev_dbg

It's not as simple as doing a sed over the driver.  You have to look
at each one and decide what it should be.  I only looked at the first
PRINT_K() and said specific one should be a pr_debug() not that all
of them should.

regards,
dan carpenter


--vIq7vvlOcsOjFaxi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOt7cvAAoJEOnZkXI/YHqR92EP/jrcDcrFKkL3yQkTGybFDg+0
iWR6gCu0wzuD+tiosqFGpc+rwqoKxSQ9T/U93RgeurKUMGpbNGgOZOlopj9z6Ksq
nwepVY2xdno7ScCpwaE1bAfAKkrDlkIC9S8CqJW7u5GkOESO0M9h7QQFsf2RJFDs
fzf5mwlcmCZ065Z6yl3Y/9545TzwRdrIPDhbT5ZN0qMbQy0xVqmhTVLz32cvZv5z
d11dmMeRH6beJLQ+tVnSwv8WENDhqR6vXaLZX/iDhtivBBJp8gnRGRb88w+bSANz
lTYeQqbq5wV+0YXdJZCBwlpS2P0rS+ick1ZPROTfltqpr/oJIJ8P+JCa2/XvmHwM
8S1TGlHNX4m1Xy2uuWujbtJKBGSGqd/gJ9RQrx+04NCiyGm1wDDRy025vVGVzfej
zgbrIWeloWJuCH/NqTUzR/P5Oz+KNyjFs53eI8nDNOY2f6DqpEYlRgmyK711921N
hrJAxU0D+4gRfJZLOUVa2SALRWEgCuDlgxw3ZVR67vPaeh1IbHLjssvQsE9bbqEX
0hx9CrGF93IGGNzEJJ6HA2mGsHcFwHhF0VjRO3COTi8V/pWT3EKKgtKS/4ED7N8V
B48aIIv/7I+qBBBgYHQuJpyhlGehJf7KlMVy006Ul8ZhLdqQi8aaTMCuVNl2FdyK
hRNlNIYmHlTDey/4UsA6
=eY8d
-----END PGP SIGNATURE-----

--vIq7vvlOcsOjFaxi--
