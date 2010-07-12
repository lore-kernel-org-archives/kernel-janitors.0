From: Dan Carpenter <error27@gmail.com>
Date: Mon, 12 Jul 2010 17:48:02 +0000
Subject: Re: [patch] prism54: call BUG_ON() earlier
Message-Id: <20100712174802.GE5658@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100710085338.GQ19184@bicker> <AANLkTikJ9Ae2HRIwdcc8oVgAc2zoVHUL7ZY9k2QO2QpS@mail.gmail.com> <20100712173714.GD5658@bicker>
In-Reply-To: <20100712173714.GD5658@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Of course the main reasons is that it silences a static checkers
warning.  :P

drivers/net/wireless/prism54/isl_ioctl.c +2073 send_simple_event(12)
	error: strcpy() 'str' too large for 'memptr' (257 vs 256)

regards,
dan carpenter
