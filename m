From: Stephen Hemminger <stephen@networkplumber.org>
Date: Thu, 11 May 2017 16:34:47 +0000
Subject: Re: [PATCH 4/4] vmbus: Adjust five checks for null pointers
Message-Id: <20170511093447.7e5b66e4@xeon-e3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
        <bca350e0-9523-dd6e-4dd8-a0f8ee93dc87@users.sourceforge.net>
In-Reply-To: <bca350e0-9523-dd6e-4dd8-a0f8ee93dc87@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 11 May 2017 18:19:21 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 May 2017 17:52:38 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written …
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Please don't do these kind of checkpatch "fix ups" on existing code.
The comparison with NULL is fine, doing this is just useless churn.

