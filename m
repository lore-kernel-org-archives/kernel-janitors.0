From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Jul 2014 15:07:22 +0000
Subject: Re: [PATCH] staging: rtl8192ee: Correct bitmask in comparsion
Message-Id: <20140708150722.GP25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404827699-7295-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1404827699-7295-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, gulsah.1004@gmail.com, gregkh@linuxfoundation.org, linville@tuxdriver.com, paulmck@linux.vnet.ibm.com, Larry.Finger@lwfinger.net

On Tue, Jul 08, 2014 at 04:54:59PM +0300, Andrey Utkin wrote:
> The issue is discovered by static checker. The proposed change (0x000c0
> -> 0x000c) is likely correct because:
> 1. 16-bit `map` holds value coming from struct
> ieee80211_vht_mcs_info.tx_mcs_map, which is described so: "TX MCS map 2
> bits for each stream, total 8 streams". The changed code refers to case
> of 2 TX streams, and 0x000c mask filters two bits related to the second
> stream. Some codelines below 0x0003 mask is used to test first stream.
> 2. Mask 0x000c is used 3 more times in that place.
> 3. Specifying 5 digits of hex value is uncommon, especially while working
> with `u16` variable. So likely the trailing zero is a typo.

This changelog is perfect.  Thanks.

regards,
dan carpenter

