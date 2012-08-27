From: viresh kumar <viresh.kumar@linaro.org>
Date: Mon, 27 Aug 2012 04:16:09 +0000
Subject: Re: [PATCH 10/13] drivers/watchdog/sp805_wdt.c: use clk_prepare_enable and clk_disable_unprepare
Message-Id: <CAOh2x=mMkCR8+Y_sPW8pRcS6fi8k=u_VpEWA0NYiUWqHrLJjCQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
	<1345996865-32082-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345996865-32082-11-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Wim Van Sebroeck <wim@iguana.be>, kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, spear-devel <spear-devel@list.st.com>

On Sun, Aug 26, 2012 at 9:31 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Clk_prepare_enable and clk_disable_unprepare combine clk_prepare and
> clk_enable, and clk_disable and clk_unprepare.  They make the code more
> concise, and ensure that clk_unprepare is called when clk_enable fails.
>
> A simplified version of the semantic patch that introduces calls to these
> functions is as follows: (http://coccinelle.lip6.fr/)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
