From: Julia Lawall <julia@diku.dk>
Date: Tue, 05 May 2009 11:30:53 +0000
Subject: p80211wext.c: possible problem with IW_ENCODE_ALG_WEP
Message-Id: <Pine.LNX.4.64.0905051330150.9552@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The file drivers/staging/wlan-ng/p80211wext.c contains the following code:

(starting at line 1490 in a recent linux-next)

		if (!(ext->alg & IW_ENCODE_ALG_WEP)) {
			pr_debug("asked to set a non wep key :(");
			return -EINVAL;
		}

The reference to IW_ENCODE_ALG_WEP seems to refer to the following
definitions in include/linux/wireless.h

/* struct iw_encode_ext ->alg */
#define IW_ENCODE_ALG_NONE	0
#define IW_ENCODE_ALG_WEP	1
#define IW_ENCODE_ALG_TKIP	2
#define IW_ENCODE_ALG_CCMP	3
#define IW_ENCODE_ALG_PMK	4
#define IW_ENCODE_ALG_AES_CMAC	5

But if the alg field returns true for a bit and with IW_ENCODE_ALG_WEP,
then it would also return true for a bit and with IW_ENCODE_ALG_CCMP and
IW_ENCODE_ALG_AES_CMAC.  Is this what is intended, or should the test be
encoded in another way?

julia
