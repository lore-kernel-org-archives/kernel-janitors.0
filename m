From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 12 Nov 2010 13:24:24 +0000
Subject: Re: [patch] Staging: rtl8712: signedness bug in init
Message-Id: <4CDD4008.9090303@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101112051113.GF3533@bicker>
In-Reply-To: <20101112051113.GF3533@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/11/2010 11:11 PM, Dan Carpenter wrote:
> PollingCnt is 20 and that means we loop 20 times and then run the
> timeout code.  After the end of the loop PollingCnt should be -1 but
> because it's an unsigned char, it's actually 255 and the timeout
> code never runs.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

As a point of interest, did you actually hit a timeout, or was this found by a
code audit?

Larry
