From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 04 Oct 2012 09:05:55 +0000
Subject: Re: [PATCH 19/20] drivers/net/ethernet/marvell/skge.c: fix error return code
Message-Id: <CA+MoWDp4W5BCA1t_HgEtLhMs1btVTOkbtBytOVtAzJriEZ-16A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349281090-10013-20-git-send-email-peter.senna@gmail.com>
	<20121003092508.6a7da662@nehalam.linuxnetplumber.net>
In-Reply-To: <20121003092508.6a7da662@nehalam.linuxnetplumber.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: mlindner@marvell.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

>
> Thanks for looking into these kind of problems. The contents
> of the patch are correct, but the automated commit message is useless.
> You shouldn't just blindly say what the automated
> script was looking for, you should describe what the bug is so that evaluators
> can decide what the impact is and if it should be backported to stable
> and vendor kernels.
>
> Please resubmit the patchs with a reasonable analysis in the commit message.
> Something like:
>
>   There is a bug in skge driver. If alloc_etherdev() fails, then
>   skge_devinit() will return NULL, and the skge_probe function incorrectly
>   returns success 0. It should return -ENOMEM instead.
>
>

Stephen, I do not want to include function names on the commit
message. What do you think about this updated message, is it
acceptable?

--- --- ---
This patch fixes a bug related to the return value of the function. In some
error cases, the function return non-negative SUCCESS values, when the
correct would be a negative ERROR value.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>
--- --- ---


Thanks,

Peter

-- 
Peter
