From: Richard Kennedy <richard@rsk.demon.co.uk>
Date: Tue, 05 May 2009 12:48:19 +0000
Subject: Re: p80211wext.c: possible problem with IW_ENCODE_ALG_WEP
Message-Id: <4A003593.60001@rsk.demon.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0905051330150.9552@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0905051330150.9552@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> The file drivers/staging/wlan-ng/p80211wext.c contains the following code:
> 
> (starting at line 1490 in a recent linux-next)
> 
> 		if (!(ext->alg & IW_ENCODE_ALG_WEP)) {
> 			pr_debug("asked to set a non wep key :(");
> 			return -EINVAL;
> 		}
> 
> The reference to IW_ENCODE_ALG_WEP seems to refer to the following
> definitions in include/linux/wireless.h
> 
> /* struct iw_encode_ext ->alg */
> #define IW_ENCODE_ALG_NONE	0
> #define IW_ENCODE_ALG_WEP	1
> #define IW_ENCODE_ALG_TKIP	2
> #define IW_ENCODE_ALG_CCMP	3
> #define IW_ENCODE_ALG_PMK	4
> #define IW_ENCODE_ALG_AES_CMAC	5
> 
> But if the alg field returns true for a bit and with IW_ENCODE_ALG_WEP,
> then it would also return true for a bit and with IW_ENCODE_ALG_CCMP and
> IW_ENCODE_ALG_AES_CMAC.  Is this what is intended, or should the test be
> encoded in another way?
> 
> julia
Hi Julia,

You're quite right, this is not what was intended.

The card only handles WEP keys so
	if (ext->alg != IW_ENCODE_ALG_WEP)  {...}

would be better.

Do you want to send a patch to correct this? If not, I can do it.

regards
Richard
