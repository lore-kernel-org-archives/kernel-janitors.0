From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 11 Jul 2019 06:46:56 +0000
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
Message-Id: <alpine.DEB.2.20.1907110845551.3626@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=====_001_next====="
List-Id: <kernel-janitors.vger.kernel.org>
References: 201907101533443009168@zte.com.cn,9d515026-5b74-cf0c-0c64-4fe242d4104e@web.de <201907111435459627761@zte.com.cn>
In-Reply-To: <201907111435459627761@zte.com.cn>
To: wen.yang99@zte.com.cn
Cc: Markus.Elfring@web.de, rjw@rjwysocki.net, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, benh@kernel.crashing.org, cheng.shengyu@zte.com.cn, galak@kernel.crashing.org, mpe@ellerman.id.au, paulus@samba.org, oss@buserror.net, xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

--=====_001_next=====
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Thu, 11 Jul 2019, wen.yang99@zte.com.cn wrote:

> > > we developed a coccinelle script to detect such problems.
> >
> > Would you find the implementation of the function “dt_init_idle_driver”
> > suspicious according to discussed source code search patterns?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpuidle/dt_idle_states.c?id=e9a83bd2322035ed9d7dcf35753d3f984d76c6a5#n208
> > https://elixir.bootlin.com/linux/v5.2/source/drivers/cpuidle/dt_idle_states.c#L208
> >
> >
> > > This script is still being improved.
> >
> > Will corresponding software development challenges become more interesting?
>
> Hello Markus,
> This is the simplified code pattern for it:
>
> 172         for (i = 0; ; i++) {
> 173                 state_node = of_parse_phandle(...);     ---> Obtain here
> ...
> 177                 match_id = of_match_node(matches, state_node);
> 178                 if (!match_id) {
> 179                         err = -ENODEV;
> 180                         break;                         --->  Jump out of the loop without releasing it
> 181                 }
> 182
> 183                 if (!of_device_is_available(state_node)) {
> 184                         of_node_put(state_node);
> 185                         continue;                    --->  Release the object references within a loop
> 186                 }
> ...
> 208                 of_node_put(state_node);  -->  Release the object references within a loop
> 209         }
> 210
> 211         of_node_put(state_node);       -->    There may be double free here.
>
> This code pattern is very interesting and the coccinelle software should also recognize this pattern.

In my experience, when you start looking at these of_node_put things, all
sorts of strange things appear...

julia
--=====_001_next=====--
