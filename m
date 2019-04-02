From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 02 Apr 2019 10:50:23 +0000
Subject: Re: [PATCH 7/7] cpufreq: ppc_cbe: fix possible object reference leak
Message-Id: <alpine.DEB.2.20.1904021249500.3297@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2019212169-1554202224=:3297"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554082674-2049-8-git-send-email-wen.yang99@zte.com.cn> <efe8fb3a-eb4a-a50a-c53a-0879a912fbd8@web.de>
In-Reply-To: <efe8fb3a-eb4a-a50a-c53a-0879a912fbd8@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Wen Yang <wen.yang99@zte.com.cn>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Yi Wang <wang.yi59@zte.com.cn>

--8323329-2019212169-1554202224=:3297
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 2 Apr 2019, Markus Elfring wrote:

> > The call to of_get_cpu_node returns a node pointer with refcount
> > incremented thus it must be explicitly decremented after the last
> > usage.
>
> I would prefer a wording like the following.
>
> A reference counter was incremented for a CPU node by a call of
> the function “of_get_cpu_node”.
> Thus decrement it after the last usage.

The original log message seems perfectly clear.

>
>
> > Detected by coccinelle with the following warnings:
>
> I wonder about the shown duplicate notification.
> Can a single message be sufficient for the code search result
> in this source file?

Since you have removed the context, I have no idea what you are talking
about.

julia
--8323329-2019212169-1554202224=:3297--
