From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 11 Jul 2019 09:04:13 +0000
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
Message-Id: <90e538ac-a1d8-8c21-34a8-830dd9a07a7b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201907111435459627761@zte.com.cn>
In-Reply-To: <201907111435459627761@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Kumar Gala <galak@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Xue Zhihong <xue.zhihong@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

> 180                         break;                         --->  Jump out of the loop without releasing it

The device node reference is released behind this for loop.


> 183                 if (!of_device_is_available(state_node)) {
> 184                         of_node_put(state_node);

This function call was added by the commit “cpuidle: dt: Add missing 'of_node_put()'”
on 2017-06-12.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/cpuidle/dt_idle_states.c?id=b2cdd8e1b54849477a32d820acc2e87828a38f3d


> 185                         continue;                    --->  Release the object references within a loop

I became curious on the applicability of an other coding style
(for a software refactoring) at this place.
How do you think about to achieve the same effect by using a goto statement
instead of two statements in such an if branch?


> 208                 of_node_put(state_node);  -->  Release the object references within a loop
> 209         }
> 210
> 211         of_node_put(state_node);       -->    There may be double free here.

This information points a recurring challenge out for safe source code analysis.
How would you like to exclude the detection of false positives finally?


> This code pattern is very interesting

Thanks that you think also in this direction.


> and the coccinelle software should also recognize this pattern.

There are some open issues to consider for available analysis tools.
How will corresponding details be clarified then?

Regards,
Markus
