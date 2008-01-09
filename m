From: Valdis.Kletnieks@vt.edu
Date: Wed, 09 Jan 2008 08:23:54 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of ioctl
Message-Id: <23897.1199867034@turing-police.cc.vt.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1199867034_3703P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de>
            <20080109080620.GE32560@infradead.org>
In-Reply-To: Your message of "Wed, 09 Jan 2008 08:06:20 GMT."
             <20080109080620.GE32560@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Nikanth Karthikesan <knikanth@suse.de>, grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--==_Exmh_1199867034_3703P
Content-Type: text/plain; charset=us-ascii

On Wed, 09 Jan 2008 08:06:20 GMT, Christoph Hellwig said:

> It's generally considered good style to only have as few as possible
> return values.  And this is especially important when returning from
> a section that's under a lock.  So in this case it would be much better
> if you changes this function to have a local 'int error' variable
> and then just do
> 
> 	error = -EFOO;
> 	goto out_unlock;

I think Christoph meant to say "as few as possible return locations".  One
should write the code to have as many different return values as are
meaningful, but return them from as few places as possible - which is what the
"assign error and goto end" paradigm does...


--==_Exmh_1199867034_3703P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFHhISacC3lWbTT17ARAreQAKC1hH87AVJtzIIFX3A/LawZijfTFwCcCvav
/wGAhWJlwyqdL1PwEuPnzx0=
=PKCJ
-----END PGP SIGNATURE-----

--==_Exmh_1199867034_3703P--
