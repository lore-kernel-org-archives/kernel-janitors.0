From: Tejun Heo <tj@kernel.org>
Date: Mon, 26 Mar 2018 16:35:32 +0000
Subject: Re: [bug report] tracing: Factorize filter creation
Message-Id: <20180326163532.GG1840639@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323084612.GA23928@mwanda>
In-Reply-To: <20180323084612.GA23928@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 26, 2018 at 07:07:35PM +0300, Dan Carpenter wrote:
>   1710          err = create_filter_start(filter_string, set_str, &pe, &filter);
>   1711          if (err)
>   1712                  return err;
>                         ^^^^^^^^^^
> But it's not set here.

Hah, that looks different from linus#master.  Anyways, yeah, if
anything isn't setting it, it'd be a bug.  I'm not very familiar with
events code tho.  I think it'd be best to report them to the perf
maintainers.

Thanks.

-- 
tejun
