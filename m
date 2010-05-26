From: Eric Anholt <eric@anholt.net>
Date: Wed, 26 May 2010 21:16:44 +0000
Subject: Re: [patch -next] i915/intel_sdvo: remove unneeded null check
Message-Id: <87bpc2l5xf.fsf@pollan.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100507084009.GZ27064@bicker>
In-Reply-To: <20100507084009.GZ27064@bicker>
To: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>
Cc: Zhao Yakui <yakui.zhao@intel.com>, Ma Ling <ling.ma@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Keith Packard <keithp@keithp.com>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--=-=-=

On Fri, 7 May 2010 10:40:09 +0200, Dan Carpenter <error27@gmail.com> wrote:
> The "connector" variable is used as the cursor in a
> list_for_each_entry() and it's always non-null so we don't need to check
> it.

Applied.  Thanks!

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv9j7wACgkQHUdvYGzw6vfSTgCdG5PoOYLSQXHtkQAMQA+72xLN
RKAAn3nghcyDMv6M0bwhRleTACcPi86g
=dw7x
-----END PGP SIGNATURE-----
--=-=-=--
