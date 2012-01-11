From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:27:33 +0000
Subject: Re: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <201201112327.33112.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 11 January 2012 23:22:35 Szymon Janc wrote:
> Changes since v1:
>  - use pr_{err,info} instead of custom macros for logs
>  - fixed quickstart_buttons_show issue pointed out by Dan
>  - Use scnprintf in quickstart_pressed_button_show
> 
> Thx for comments.

Opps.  Please ignore
[PATCH 15/16] Staging: quickstart: Add QS_INFO and QS_ERR macros for logs
[PATCH 16/16] Staging: quickstart: Bump driver version to 1.04
in this series...

-- 
Szymon K. Janc
szymon@janc.net.pl

