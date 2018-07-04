From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 04 Jul 2018 04:30:57 +0000
Subject: Re: [PATCH net-next] net: sched: act_pedit: fix possible memory leak in tcf_pedit_init()
Message-Id: <CAM_iQpX3X-Z596m=V5avh90ZXmcggPi7F+7V0VqEuA4YmvSyHg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530625512-122785-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530625512-122785-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, Amir Vadai <amir@vadai.me>, Linux Kernel Network Developers <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jul 3, 2018 at 6:36 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> 'keys_ex' is malloced by tcf_pedit_keys_ex_parse() in tcf_pedit_init()
> but not all of the error handle path free it, this may cause memory
> leak. This patch fix it.
>
> Fixes: 71d0ed7079df ("net/act_pedit: Support using offset relative to the conventional network headers")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Cong Wang <xiyou.wangcong@gmail.com>
