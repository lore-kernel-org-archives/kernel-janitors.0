From: Tejun Heo <tj@kernel.org>
Date: Fri, 06 Aug 2010 13:37:21 +0000
Subject: Re: [PATCH] percpu: remove address_space attribute if !SMP
Message-Id: <4C5C1011.6080209@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281098768-5724-1-git-send-email-namhyung@gmail.com>	 <4C5C04D8.1080103@kernel.org> <1281099197.1655.11.camel@leonhard>	 <4C5C06A6.7070206@kernel.org> <1281101014.1655.20.camel@leonhard>
In-Reply-To: <1281101014.1655.20.camel@leonhard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namhyung Kim <namhyung@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On 08/06/2010 03:23 PM, Namhyung Kim wrote:
> Sure. :-)
> Although I'm not sure that it is really needed, if so I'll do that.

Well, the whole __percpu markup thing is to detect misuse of percpu
pointers.  I think it would definitely be better to have the sanity
check for UP code too.  It's not like it's gonna cost any runtime
overhead and all the needed pieces are already there.

Thanks.

-- 
tejun
