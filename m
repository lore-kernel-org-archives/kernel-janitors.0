From: Tejun Heo <tj@kernel.org>
Date: Fri, 06 Aug 2010 12:49:28 +0000
Subject: Re: [PATCH] percpu: remove address_space attribute if !SMP
Message-Id: <4C5C04D8.1080103@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281098768-5724-1-git-send-email-namhyung@gmail.com>
In-Reply-To: <1281098768-5724-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namhyung Kim <namhyung@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/06/2010 02:46 PM, Namhyung Kim wrote:
> percpu data has no special meaning in case of !CONFIG_SMP.
> This removes lots of sparse warnings.
> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>

But they should still be accessed through the accessors and if they
are accessed through accessors, there shouldn't be sparse warnings
regarding them.  Maybe UP accessors are missing proper markups?  Do
those warnings only happen on UP config?

-- 
tejun
