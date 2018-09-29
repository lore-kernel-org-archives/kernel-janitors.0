From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 29 Sep 2018 08:56:42 +0000
Subject: Re: [PATCH v2 -next] usb: typec: remove set but not used variables 'snk_ma, flags'
Message-Id: <8c4f11a8-bb7e-fbb1-d573-02746638237e@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538204292-142828-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538204292-142828-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello!

On 9/29/2018 9:58 AM, YueHaibing wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/typec/tcpm/tcpm.c: In function 'tcpm_pd_select_pps_apdo':
> drivers/usb/typec/tcpm/tcpm.c:2212:39: warning:
>   variable 'snk_ma' set but not used [-Wunused-but-set-variable]
> 
> drivers/usb/typec/tcpm/tcpm.c: In function 'tcpm_pd_build_pps_request':
> drivers/usb/typec/tcpm/tcpm.c:2405:37: warning:
>   variable 'min_mv' set but not used [-Wunused-but-set-variable]

    The subject still doesn't match the description and the diff.

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
[...]

MBR, Sergei
