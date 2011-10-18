From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 18 Oct 2011 06:54:47 +0000
Subject: Re: [patch] rndis_wlan: add range check in del_key()
Message-Id: <1318920887.3958.0.camel@jlt3.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018064729.GQ27732@elgon.mountain>
	 (sfid-20111018_084803_556321_DCB3993A)
In-Reply-To: <20111018064729.GQ27732@elgon.mountain> (sfid-20111018_084803_556321_DCB3993A)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2011-10-18 at 09:47 +0300, Dan Carpenter wrote:
> Wifi drivers can have up to 6 keys but the rndis_wlan only has 4 so
> it needs to have its own checks to make sure we don't go out of
> bounds.  The add_key() function already checks but I added some
> checks to del_key() and set_default_key().

Semantically, that shouldn't be possible unless it advertises support
for WLAN_CIPHER_SUITE_AES_CMAC. Is there a bug in those checks?

The checks don't hurt, obviously.

johannes

