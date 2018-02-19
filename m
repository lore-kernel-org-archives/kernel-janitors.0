From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 19 Feb 2018 03:56:10 +0000
Subject: Re: [PATCH 1/2] cpufreq: powernow-k8: Delete an error message for a failed memory allocation in thre
Message-Id: <20180219034410.GJ28462@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4dd36236-fc39-19e6-c1a7-a094cf13469c@users.sourceforge.net>
 <895a6088-5266-0be7-90f6-b1f838eb58c1@users.sourceforge.net>
In-Reply-To: <895a6088-5266-0be7-90f6-b1f838eb58c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 15-02-18, 20:29, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 15 Feb 2018 20:00:23 +0100
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/cpufreq/powernow-k8.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
