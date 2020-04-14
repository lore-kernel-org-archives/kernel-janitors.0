From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Apr 2020 18:49:25 +0000
Subject: Re: [PATCH] pwm: Add missing '\n' in log messages
Message-Id: <20200414184925.GA12862@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411153528.30130-1-christophe.jaillet@wanadoo.fr>
 <20200414135827.GB3593749@ulmo>
 <f13a8754-3866-d3d2-eaff-29cb6d14ff8d@wanadoo.fr>
In-Reply-To: <f13a8754-3866-d3d2-eaff-29cb6d14ff8d@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Thierry Reding <thierry.reding@gmail.com>, paul@crapouillou.net, Joe Perches <joe@perches.com>, u.kleine-koenig@pengutronix.de, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Huh...

If you look at dev_vprintk_emit().  It looks like if
create_syslog_header() returns a string then vprintk_store() will add
a newline.

I guess that means that dev_printk() can't be used to pr_cont().  And
probably that's deliberate because using pr_cont() after boot is racy
anyway.

regards,
dan carpenter
