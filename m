From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Sep 2019 06:15:16 +0000
Subject: Re: [PATCH] staging: rtl8188eu: remove dead code in do-while conditional step
Message-Id: <20190924061200.GK2959@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190923194806.25347-1-connor.kuehl@canonical.com>
In-Reply-To: <20190923194806.25347-1-connor.kuehl@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Connor Kuehl <connor.kuehl@canonical.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Larry.Finger@lwfinger.net

On Mon, Sep 23, 2019 at 12:48:06PM -0700, Connor Kuehl wrote:
> @@ -103,7 +102,7 @@ static s32 FillH2CCmd_88E(struct adapter *adapt, u8 ElementID, u32 CmdLen, u8 *p
>  		adapt->HalData->LastHMEBoxNum >  			(h2c_box_num+1) % RTL88E_MAX_H2C_BOX_NUMS;
>  
> -	} while ((!bcmd_down) && (retry_cnts--));
> +	} while (!bcmd_down);

Just get rid of the whole do while loop, because it just goes through
one time.  It doesn't loop.   Get rid of bcmd_down as well.

regards,
dan carpenter
