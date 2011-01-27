From: David Brown <davidb@codeaurora.org>
Date: Thu, 27 Jan 2011 19:00:55 +0000
Subject: Re: [PATCH 2/2] drivers/staging/msm/lcdc.c: Convert IS_ERR result to PTR_ERR
Message-Id: <8yabp325fyw.fsf@huya.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1296143347-17508-2-git-send-email-julia@diku.dk>
In-Reply-To: <1296143347-17508-2-git-send-email-julia@diku.dk> (Julia Lawall's
	message of "Thu, 27 Jan 2011 16:49:07 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, Daniel Walker <dwalker@codeaurora.org>, Stepan Moskovchenko <stepanm@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Thu, Jan 27 2011, Julia Lawall wrote:

> This code elsewhere returns a negative constant to an indicate an error,
> while IS_ERR returns the result of a >= operation.
>
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: David Brown <davidb@codeaurora.org>

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
