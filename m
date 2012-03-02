From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 12:55:02 +0000
Subject: Re: [patch] dma-debug: debugfs_create_bool() takes a u32 pointer
Message-Id: <20120302125502.GW1003@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="c7rykKtsZvepKFKR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302065832.GE24508@elgon.mountain>
 <20120302112203.GA14827@hmsreliant.think-freely.org>
In-Reply-To: <20120302112203.GA14827@hmsreliant.think-freely.org>
To: Neil Horman <nhorman@tuxdriver.com>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--c7rykKtsZvepKFKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 02, 2012 at 06:22:03AM -0500, Neil Horman wrote:
> This certainly works, but a quick search of call sites shows this isn't the only
> place someone passes a bool to debugfs_create_bool. I think the better solution
> would be to change debugfs_create_bool and its corresponding read/write methods
> to actually work with a bool type, and then clean all the call sites to pass in
> a bool properly, instead of a u32.

There is only one other call site which gets this wrong, and I sent
a fix for that today as well.  But yes, you're probably right that
would be cleaner.

regards,
dan carpenter


--c7rykKtsZvepKFKR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPUMMmAAoJEOnZkXI/YHqRpDMP/36dETq3d6BwrI4I9RE3fStJ
7mqSDha/OAyR2KQ9Com1wAMtHIhkbpp2NSxr5ighxV4Iv2inSj1v2cJM0xatssvl
OseuhWWFxB/KMcBbixznBbcjT6sT5F6UCzG+es7VHgHsmYY+qyQfM6slbLKnBofK
g477Ta8Aj7qNvHt+m7RG6Xg1cAUR6GKMBsp+z1xD7zWLPaI/2a4jsHBxA3QwOwzD
gE1PVTypNNkVlFokFk2XSOQKUKEIjnA7+p4yEe9ri4cs4mZwvIcioNqIUI5Ch8j2
dTMcGNtjt3KyGVAXGDANZTT2XfDmbEgjZ0yz3yH2x4I5FW01MbgO34O6lTgi2FbJ
1NyBXfKUYuE7kcn3bRrBJfCUKQKFTrctn333Hp/XEq1AZQXMFDtrqE2pHrdpUj0n
cKpSZhDLL08TjAkI1Xh8rdN6IwQ/AF4azAqOSqszEG0sHAm62lGe84vRrKEeNGoU
M4/iLOkkzkmJ0q/WVpj27d/3ZdPNF1f/NVAKjdqOPY1CBlaoGiFNHElxN+cpfJPs
eWQMTIJsoQMTNSnPs837krMW+j71aUprrjB3AIhdKkKNC5bQ6QAR2VjVgdQYSfyK
d4YNcD2J8Ycm86uCx7WaD5nZVuLegXU5eBSEbDAC8M/bE4mxh4m7EE4vynzqWsP5
2ogX+tTT8ZAe5n3Zye+s
=hmC7
-----END PGP SIGNATURE-----

--c7rykKtsZvepKFKR--
