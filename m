From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 11 Jul 2018 17:14:26 +0000
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in nsp_pinmux_probe()
Message-Id: <15d64c26-f2c3-e3bb-2768-e5c9726cde49@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
 <7b4361a5-f757-179c-57b6-44359801baad@broadcom.com>
 <6c133df2-7dc7-d58b-297a-c27b87e7edd3@arm.com>
 <c0163341-1445-76e2-644f-22cab0735f82@broadcom.com>
In-Reply-To: <c0163341-1445-76e2-644f-22cab0735f82@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org



On 11/07/18 18:11, Ray Jui wrote:
> 
> 

[...]

> 
> I meant there's a reason why xxx_resource was not used, which is most
> likely due to some resource conflict with another driver on NSP.
> 

Ah OK, sorry for the noise then.

-- 
Regards,
Sudeep
