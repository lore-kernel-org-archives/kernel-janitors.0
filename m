From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 17 Oct 2016 05:58:01 +0000
Subject: Re: [patch] greybus: fix a leak on error in gb_module_create()
Message-Id: <CAOh2x=nvdM=0g8e+sQsCjezQfkeDL5y8YHAu6qwDNeXgkWSP7Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161014191639.GB21917@mwanda>
In-Reply-To: <20161014191639.GB21917@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 15, 2016 at 12:48 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> We should release ->interfaces[0] as well.
>
> Fixes: b15d97d77017 ("greybus: core: add module abstraction")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
