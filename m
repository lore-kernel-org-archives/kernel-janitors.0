From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jun 2020 07:26:25 +0000
Subject: Re: Forest Bond <forest@alittletooquiet.net>,Greg Kroah-Hartman <gregkh@linuxfoundation.org>,devel@d
Message-Id: <20200608072625.GV30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200607224156.GA24090@ip-172-31-24-31.ec2.internal>
In-Reply-To: <20200607224156.GA24090@ip-172-31-24-31.ec2.internal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rodolfo C. Villordo" <rodolfovillordo@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 07, 2020 at 10:41:56PM +0000, Rodolfo C. Villordo wrote:
>  	/* RTSRrvTime */
> -	uRrvTime = uRTSTime + uCTSTime + uAckTime + uDataTime + 3 * pDevice->uSIFS;
> +	uRrvTime = uRTSTime + uCTSTime + uAckTime + uDataTime
> +			+ 3 * pDevice->uSIFS;

The + character should go on the first line:

	uRrvTime = uRTSTime + uCTSTime + uAckTime + uDataTime +
		   3 * pDevice->uSIFS;

The second line should be indented with:

[tab][tab][space][space][space]3 * pDevice->uSIFS;

Same rules apply everywhere.  I'm not going to comment on every line.

>  	case RTSDUR_BA_F0: /* RTSDuration_ba_f0 */
> -		uCTSTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 14, pDevice->byTopCCKBasicRate);
> -		if ((byFBOption = AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> +		uCTSTime = bb_get_frame_time(pDevice->byPreambleType, byPktType,
> +					     14, pDevice->byTopCCKBasicRate);
> +		if ((byFBOption = AUTO_FB_0) && (wRate >= RATE_18M) &&
> +		    (wRate <= RATE_54M))


Here it's awkward to break the two wRate conditions across multiple
lines.  It's better to write:

		if ((byFBOption = AUTO_FB_0) &&
	            (wRate >= RATE_18M) && (wRate <= RATE_54M))

regards,
dan carpenter
