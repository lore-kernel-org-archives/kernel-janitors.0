From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 10 Jul 2019 15:15:33 +0000
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
Message-Id: <9d515026-5b74-cf0c-0c64-4fe242d4104e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201907101533443009168@zte.com.cn>
In-Reply-To: <201907101533443009168@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Kumar Gala <galak@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Xue Zhihong <xue.zhihong@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

> we developed a coccinelle script to detect such problems.

Would you find the implementation of the function “dt_init_idle_driver”
suspicious according to discussed source code search patterns?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpuidle/dt_idle_states.c?id=e9a83bd2322035ed9d7dcf35753d3f984d76c6a5#n208
https://elixir.bootlin.com/linux/v5.2/source/drivers/cpuidle/dt_idle_states.c#L208


> This script is still being improved.

Will corresponding software development challenges become more interesting?

Regards,
Markus
