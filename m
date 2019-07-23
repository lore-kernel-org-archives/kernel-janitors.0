From: Tejun Heo <tj@kernel.org>
Date: Tue, 23 Jul 2019 22:44:36 +0000
Subject: Re: [PATCH] cgroup: Replace a seq_printf() call by seq_puts() in cgroup_print_ss_mask()
Message-Id: <20190723224436.GG696309@devbig004.ftw2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d465ca81-a870-b88c-0ea2-5e8bfbefb79d@web.de>
In-Reply-To: <d465ca81-a870-b88c-0ea2-5e8bfbefb79d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cgroups@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, Li Zefan <lizefan@huawei.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jul 02, 2019 at 07:33:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 Jul 2019 19:26:59 +0200
> 
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function “seq_puts”.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to cgroup/for-5.4.

Thanks.

-- 
tejun
