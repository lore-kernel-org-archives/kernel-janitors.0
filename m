From: Connor Kuehl <connor.kuehl@canonical.com>
Date: Thu, 26 Sep 2019 15:01:18 +0000
Subject: Re: [PATCH] staging: rtl8188eu: fix possible null dereference
Message-Id: <2f07d7cb-23a1-f5c0-af9f-1c3e19a7082c@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925213215.25082-1-connor.kuehl@canonical.com>
 <b725820f-525c-519b-4474-476abf004985@lwfinger.net>
In-Reply-To: <b725820f-525c-519b-4474-476abf004985@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, gregkh@linuxfoundation.org, straube.linux@gmail.com, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/25/19 5:05 PM, Larry Finger wrote:
> This change is a good one, but why not get the same fix at line 779?

Ah yes! Thanks for pointing that out. I missed that. I will send a V2 
shortly.

Thank you,

Connor

> 
> Larry
> 
