From: Tony Lindgren <tony@atomide.com>
Date: Thu, 12 Jul 2018 05:26:27 +0000
Subject: Re: [PATCH -next] pinctrl: single: Fix missing unlock on error path
Message-Id: <20180712052627.GO99251@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531312411-134133-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1531312411-134133-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

* Wei Yongjun <weiyongjun1@huawei.com> [180711 12:27]:
> Add the missing unlock before return from function
> in the error handling case.

Oops yes sorry about that and thanks for fixing it:

Acked-by: Tony Lindgren <tony@atomide.com>
