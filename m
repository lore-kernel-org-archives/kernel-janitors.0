From: Leo Yan <leo.yan@linaro.org>
Date: Thu, 13 Jun 2019 10:10:04 +0000
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
Message-Id: <20190613101004.GB5242@leoy-ThinkPad-X240s>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065815.GF16334@mwanda>
 <20190613074922.GB21113@leoy-ThinkPad-X240s>
 <20190613081419.GG1893@kadam>
 <20190613095637.GA5242@leoy-ThinkPad-X240s>
In-Reply-To: <20190613095637.GA5242@leoy-ThinkPad-X240s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 13, 2019 at 05:56:37PM +0800, Leo Yan wrote:

[...]

> > In my experience it's better to initialize the return as late as
> > possible so that you get static checker warnings when you forget to set
> > the error code.
> 
> Just want to check one thing, which static checker you are using?

Okay, I think it's smatch :)

Thanks,
Leo Yan
